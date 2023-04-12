# blind.sh

This asks OpenAI to transcribe your voice, then asks ChatGPT to get a command from that and then uses AppleScript to try to do it.  My hope is that work in this direction will continue 
to help support accessibility for those with different vision.

## Video Example (Turn Sound On)

https://user-images.githubusercontent.com/466317/231347086-75e452f0-b329-456f-8374-9f6a3a9314a9.mp4

Chrome, "Hacker News"

https://user-images.githubusercontent.com/466317/231347096-fcd41b30-799b-43b7-a472-f61d2b817aaa.mp4

Text Edit, "Hello World"

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
