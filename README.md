Instructions for installing the RMM agent on Mac computers without paying for codesigning. 

<details>
<summary>Compile the agent yourself</summary>
<br>

```
brew install golang

git clone https://github.com/amidaware/rmmagent.git

cd rmmagent
```

Then, if using Intel Mac:

`env CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -ldflags "-s -w"`

If using silicon Mac

`env CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -ldflags "-s -w"`
</details>

**OR**

<details>
<summary>Download the agent from here:</summary>
<br>

Intel Mac:

https://github.com/kylefmohr/MacOSRMM-Script/releases/download/v2.4.9/rmmagent-amd64-v2.4.9

Silicon Mac:

https://github.com/kylefmohr/MacOSRMM-Script/releases/download/v2.4.9/rmmagent-arm64-v2.4.9

</details>

---

Because we're not paying for codesigning, we'll get a scary warning the first time we run it. To workaround this, before installing the agent, open the file once by itself *while holding down the `Option` key*. Then click "Open" on the scary warning. Once you've done this, you can proceed to the installation.

## Installation Instructions:

 - Go to the web portal for your TacticalRMM instance, and click `Agent` > `Install Agent`
 - Select all the options you'd like, *but change macOS to Windows*, and select *manual* for installation method. The Arch section can be ignored.
   
   <img width="625" alt="image" src="https://github.com/kylefmohr/MacOSRMM-Script/assets/6644803/9ce36c59-85ad-4816-8a61-0a069f26ec51">

 - Then click "Show Manual Instructions", and copy beginning at `-m install` until the end. You should have something like: `-m install --api https://api.yourdomain.com --client-id 1 --site-id 1 --agent-type workstation --auth <RandomString> --rdp --ping --power`
 - Open the terminal and run the downloaded agent *as sudo*, pasting the command line options you previously copied after the binary. Your command should look something like: `sudo rmmagent-amd64-v2.4.9 -m install --api https://api.yourdomain.com --client-id 1 --site-id 1 --agent-type workstation --auth <RandomString> --rdp --ping --power`
 - If you get an error about how the file isn't executable, you may have to run `chmod +x <your rmmagent binary>`, then rerun the above command. 

You should be good to go!


