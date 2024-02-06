--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)
]]--

entered = false;
foxyblocked = false;


function story(aName)
	CLS();
	if(aName == "start") then
		entered = false;
		foxyblocked = false;
		playMusic("wind.wav")
		setBackground("fnafpizza.png")
		createTextfield("You stumble upon Freddy Fazbear's Pizza. What will you do?")
		createButton("exit", "2spooky4me. Turn around and leave")
		createButton("westhall1", "Enter")
	end

	if(aName == "westhall1") then
		CLS();
		setBackground("westhall.png")
		playMusic("ambience.wav")
		if(entered == false) then
			createTextfield("You've entered the hallway, the door seems to have locked behind you.")
			playSound("doorlock.wav")
			createButton("westhall2", "Go down the hallway");
			createButton("office", "Enter the door on your right")
			entered = true;
		else 
			playSound("footstep.wav")
			createTextfield("You're in the west hallway.")
			createButton("westhall2", "Go down the hallway");
			createButton("office", "Enter the office on your right")
		end
	end

	if(aName == "westhall2") then
		playSound("footstep.wav")
		if(foxyblocked == false) then
			setBackground("covefoxy.png")
			createTextfield("You stumble upon a giant fox-like animatronic.")
			createButton("foxydie", "Run.")
		else
			setBackground("cove.png")
			createTextfield("There seems to be a giant fox-like animatronic hiding behind the curtain")
			createButton("foxydie", "Inspect the animatronic")
			createButton("mainhall", "Continue forward")
			createButton("westhall", "Go back")
		end
	end

	if(aName == "office") then
		setBackground("office.png")
		playMusic("hum.wav")
		if(not foxyblocked) then
			playSound("foxyrun.wav")
			createButton("office-closed-left", "Close the left door")
			createButton("foxydie", "Close the right door")
			createButton("foxydie", "Enter the left door")
			createButton("freddydie", "Enter the right door")
			createButton("foxydie", "Look at the security cameras")
		else
			createButton("cam", "Look at the security cameras")
			createButton("office-closed-left", "Close the left door")
			createButton("office-closed-right", "Close the right door")
			createButton("westhall1", "Enter the left door")
			createButton("freddydie", "Enter the right door")
			createButton("foxydie", "Look at the security cameras")
		end
	end

	if(aName == "office-closed-left") then
		setBackground("office.png")
		playMusic("hum.wav")
		if(not foxyblocked) then
			createButton("office-closed-left", "Close the left door")

	if(aName == "cam") then
		setBackground("cams.png")
		playMusic("hum.wav")
		createButton("office","Close cams")
	end

	if(aName == "foxydie") then
		playSound("jumpscare.wav")
		setBackground("foxydie.png")
		createTextfield("lmao u died")
		createButton("start", "restart")
		createButton("exit", "exit")
	end
	if(aName == "exit") then
		exitGame();
	end
end

