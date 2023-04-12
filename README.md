# blind.sh

This asks OpenAI to transcribe your voice, then asks ChatGPT to get a command from that and then uses AppleScript to try to do it.  My hope is that work in this direction will continue 
to help support accessibility for those with different vision.

## Video Example


https://user-images.githubusercontent.com/466317/231329358-df73f2e2-cb35-4b56-8a96-523a0e027d8c.mp4


## Warning

This could severely damage your computer and is more or less just a 'show and tell' of what is possible. That said, this prompts before running anything.  
Additionally, simple work on boundaries could make this safe and production ready quite quickly.

## Instructions

1. Get homebrew

2. Clone this
```
git clone https://github.com/realrasengan/blind.sh
```

3. Install sox, lame and jq
```
brew install sox lame jq
```

4. Install an Automator

- Open Automator

- Create a new Application

- Go to Run Shell Script

- Put:
```
/Path/to/blind.sh/blind.sh
```

5. Save

6. Move to Applications Folder



## Note

Don't forget to delete your OpenAI api key before uploading on github, not 
like me ;) (it's since been deleted)

## License

MIT Licensed.
