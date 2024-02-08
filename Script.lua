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
timer = 0;
officeVisited = false;
notDead = true;
wearingSuit = false;
hasKey = false;

function story(aName)
	CLS();





	--outside start--
	if(aName == "start") then
		playMusic("wind.wav")
		setBackground("fnafpizza.png")
		createTextfield("You stumble upon Freddy Fazbear's Pizza. What will you do?")
		createButton("exit", "2spooky4me. Turn around and leave")
		createButton("westhall1", "Enter")
	end

	--west hall 1, entrance--
	if(aName == "westhall1") then
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

		if(hasKey) then
			createButton("win","Use key and leave")
		end
	end

	--cove--
	if(aName == "westhall2") then
		playSound("footstep.wav")
		playMusic("ambience.wav")
		if(foxyblocked == false) then
			playSound("piratesong.wav")
			setBackground("covefoxy.png")
			createTextfield("You stumble upon a giant fox-like animatronic.")
			createButton("foxyscare", "Run.")
		else
			setBackground("cove.png")
			createTextfield("There seems to something hiding behind the curtain")
			createButton("foxyscare", "Inspect the curtain")
			createButton("main", "Go to the dining area")
			createButton("westhall1", "Go back in the direction of the office")
		end
	end

	--office--
	if(aName == "office") then
		officeVisited = true;
		setBackground("office.png")
		playMusic("hum.wav")
		if(foxyblocked == false) then
			createTextfield("You hear something running toward you")
			playSound("foxyrun.wav")
			createButton("office-closed-left", "Close the left door")
			createButton("foxyscare", "Close the right door")
			createButton("foxyscare", "Enter the left door")
			createButton("freddyscare", "Enter the right door")
			createButton("foxyscare", "Look at the security cameras")
		else
			createTextfield("You're in the security office")
			createButton("cam", "Look at the security cameras")
			createButton("office-closed-left", "Close the left door")
			createButton("office-closed-right", "Close the right door")
			createButton("westhall1", "Enter the left door")
			if(wearingSuit) then
			createButton("easthall","Enter the right door")
			else
			createButton("freddyscare", "Enter the right door")
			end
		end
	end

	--office closed left--
	if(aName == "office-closed-left") then
		setBackground("office-closed-left.png")
		playMusic("hum.wav")
		if(foxyblocked == false) then
			playSound("foxydoor.wav")
			foxyblocked = true;
		end
		createButton("office", "Open the left door")
	end	

	--office closed right--
	if(aName == "office-closed-right") then
		setBackground("office-closed-right.png")
		playMusic("hum.wav")
		playSound("freddylaugh.wav")
		createButton("office", "Open the right door")
	end	

	--security cams--
	if(aName == "cam") then
		createTextfield("The cameras seem to be broken")
		playSound("opencams.wav")
		setBackground("cams.png")
		playMusic("hum.wav")
		createButton("office","Close cams")
	end

	--main area--
	if(aName == "main") then
		createTextfield("Main dining area")
		setBackground("main.png")
		playMusic("ambience.wav")
		playSound("footstep.wav")

		createButton("kitchen","Go to the kitchen")
		createButton("stage","Go to the stage")
		createButton("backroom","Go to the parts and service")
		createButton("westhall2","Go to the west hall")
		if(wearingSuit) then
		createButton("easthall","Go to the east hall")
		else
			createButton("freddyscare","Go to the east hall")
		end
	end

	--kitchen--
	if(aName == "kitchen") then
		setBackground("chikascare.png")
		playSound("jumpscare.wav")
		createTextfield("You died")
		createButton("exit","Exit")
	end

	--stage--
	if(aName == "stage") then
		setBackground("bonniescare.png")
		playSound("jumpscare.wav")
		createTextfield("You died")
		createButton("exit","Exit")
	end
	
	--backroom--
	if(aName == "backroom") then
		setBackground("partsservice.png")
		playMusic("ambience2.wav")

		if(not wearingSuit) then
			createTextfield("There is a freddy suit here.")
			createButton("backroom2","Wear the suit")
			createButton("main","Leave")
		else
			createTextfield("There's not much of use here")
			createButton("main","Leave")
		end
	end

	--backroom2--
	if(aName == "backroom2") then
		wearingSuit = true;
		setBackground("partsservice.png")
		playMusic("ambience2.wav")
		createTextfield("This suit might work as a disguise")
		createButton("main","Leave")
	end

	--easthall--
	if(aName == "easthall") then
		setBackground("easthall.png")
		playMusic("ambience2.wav")
		playSound("freddylaugh.wav")
		
		createButton("main","Go to dining area")
		createButton("office","Go to the office")
		if(not hasKey) then
			createButton("key","Pick up the key")
			createTextfield("Freddy is looming over you ominously. There's a key next to him")
		else
			createTextfield("Freddy is looming over you ominously.")
		end
	end

	--key--
	if(aName == "key") then
		hasKey = true;
		createTextfield("Freddy didn't move an inch.")
		createButton("main","Go to dining area")
		createButton("office","Go to the office")
	end

	--foxy scare--
	if(aName == "foxyscare") then
		playSound("jumpscare.wav")
		setBackground("foxyscare.png")
		createTextfield("Foxy killed you")
		createButton("exit", "exit")
	end

	--freddy scare--
	if(aName == "freddyscare") then
		playSound("jumpscare.wav")
		setBackground("freddyscare.png")
		createTextfield("Freddy bit your head off")
		createButton("exit", "exit")
	end

	--[[bonnie scare--
	if(aName == "bonniescare") then
		playSound("jumpscare.wav")
		setBackground("bonniescare.png")
		createTextfield("Freddy bit your head off")
		createButton("exit", "exit")
	end

			--freddy scare--
	if(aName == "freddyscare") then
		playSound("jumpscare.wav")
		setBackground("freddyscare.png")
		createTextfield("Freddy bit your head off")
		createButton("exit", "exit")
	end]]


	if(aName == "win") then
		setBackground("fnafpizza.png")
		playMusic("6am.wav")
		playSound("yay.wav")
		createTextfield("You won! Thanks for playing!")
		createButton("exit","Quit game")
	end

	if(aName == "exit") then
		exitGame();
	end

end

