(
/*

Hello!

To run this program... simply click once anywhere on this page,
and press "cmd/ctrl - enter" on your keyboard.

And if that does not work for some reason, click on the "Language" tab
above, and click on "Evaluate File".

*/

//GOAL OF THIS MUSIC BOT - to create the musician I want it to be.

// GUI

if(~number_of_instruments == nil, {~number_of_instruments = 3;});

~duranduranbot_GUI_func = {

	var w, /*~firstview,*/ firstviewtext1, firstviewtext2, firstviewtext3, firstviewtext4, firstviewtext5, firstviewtext6, firstviewnextbutton, mainview, mainviewtext, maincolor, randseedEZText1, randseedEZText2, randseedEZText3, randseed_1_make, randseed_2_make, randseed_3_make, randseedviewtext1,randseedviewtext2,
	randseedviewtext3, numerologynameEZText1, numerologynameEZText2, numerologynameEZText3, numerologynameviewtext1, numerologynameviewtext2, numerologynameviewtext3,
	generatepiecebutton, playbutton, enterdatabasebutton, recordbutton, songtitletext, songtitlestatictext, piecedurationstatictext, machinelearningbutton, machinelearningtext;
	w = Window("DuranDuranbot",
		Rect(Window.availableBounds.width/4, Window.availableBounds.height/4, Window.availableBounds.width/2, Window.availableBounds.height/2),
		resizable: true, border:true);

	maincolor = Color.white;

	~front_page_func = {

		~firstview = View(w, Rect(0, 0, w.bounds.width, w.bounds.height));
		/*view.clearOnRefresh = false;*/
		~firstview.background = maincolor;
		~firstviewboundsWIDTH = ~firstview.bounds.width;
		~firstviewboundsHEIGHT = ~firstview.bounds.height;


		firstviewtext1 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/1.0285714285714, ~firstviewboundsHEIGHT/3.4774535809019));
		firstviewtext1.background=maincolor;
		firstviewtext1.string = "Hello. This is DuranDuranbot. \n\nTo enhance the creativity of this AI bot... please consider providing it with some personal creative inspiration of yours by entering 3 number values into the 3 fields below, numerical values up to 8 digits long, and hit Enter. Consider writing down the 3 values you gave it to be able to replicate exactly the music made by this AI in this specific instance at a later date - although they will still be saved in the "++"duranduranbot_saved_random _seeds.scd".quote++" file, accessible on the next page.";
		firstviewtext1.align = \topLeft;
		firstviewtext1.font = Font(size: ~firstviewboundsWIDTH/48);


		randseedEZText1 = TextField(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/3, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		randseedEZText1.string = "random seed 1";
		randseedEZText1.background_(Color.black);
		randseedEZText1.stringColor_(Color.white);
		randseedEZText1.font = Font(size: ~firstviewboundsWIDTH/48);
		randseedEZText1.action = {
			randseed_1_make = randseedEZText1.value;
			randseed_1_make = randseed_1_make.asString++"";
			randseed_1_make = randseed_1_make.separate;
			if(randseed_1_make.size > 8, {randseed_1_make = nil; randseedEZText1.string = "must be 8 digits or less";}, {
				randseed_1_make = randseed_1_make.join.asString.interpret;
				randseedviewtext1.string = if(randseed_1_make.isNumber == true, {
					randseed_1_make = randseed_1_make.asFloat; randseed_1_make.postln; ~randseed_1 = randseed_1_make; ~save_random_seeds_func.value; ~randseed_1.asString++" entered";}, {
					randseed_1_make = nil; randseedEZText1.string = "enter numerical value";
				});
			});
		};

		randseedEZText2 = TextField(~firstview, Rect(~firstviewboundsWIDTH/3.7894736842105, ~firstviewboundsHEIGHT/3, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		randseedEZText2.string = "random seed 2";
		randseedEZText2.background_(Color.black);
		randseedEZText2.stringColor_(Color.white);
		randseedEZText2.font = Font(size: ~firstviewboundsWIDTH/48);
		randseedEZText2.action = {
			randseed_2_make = randseedEZText2.value;
			randseed_2_make = randseed_2_make.asString++"";
			randseed_2_make = randseed_2_make.separate;
			if(randseed_2_make.size > 8, {randseed_2_make = nil; randseedEZText2.string = "must be 8 digits or less";}, {
				randseed_2_make = randseed_2_make.join.asString.interpret;
				randseedviewtext2.string = if(randseed_2_make.isNumber == true, {
					randseed_2_make = randseed_2_make.asFloat; randseed_2_make.postln; ~randseed_2 = randseed_2_make; ~save_random_seeds_func.value; ~randseed_2.asString++" entered";}, {
					randseed_2_make = nil; randseedEZText2.string = "enter numerical value";
				});
			});
		};

		randseedEZText3 = TextField(~firstview, Rect(~firstviewboundsWIDTH/1.8947368421053, ~firstviewboundsHEIGHT/3, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		randseedEZText3.string = "random seed 3";
		randseedEZText3.background_(Color.black);
		randseedEZText3.stringColor_(Color.white);
		randseedEZText3.font = Font(size: ~firstviewboundsWIDTH/48);
		randseedEZText3.action = {
			randseed_3_make = randseedEZText3.value;
			randseed_3_make = randseed_3_make.asString++"";
			randseed_3_make = randseed_3_make.separate;
			if(randseed_3_make.size > 8, {randseed_3_make = nil; randseedEZText3.string = "must be 8 digits or less";}, {
				randseed_3_make = randseed_3_make.join.asString.interpret;
				randseedviewtext3.string = if(randseed_3_make.isNumber == true, {
					randseed_3_make = randseed_3_make.asFloat; randseed_3_make.postln; ~randseed_3 = randseed_3_make; ~save_random_seeds_func.value; ~randseed_3.asString++" entered";}, {
					randseed_3_make = nil; randseedEZText3.string = "enter numerical value";
				});
			});
		};

		randseedviewtext1 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/2.6063618290258, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		randseedviewtext1.background=maincolor;
		randseedviewtext1.string = if(~randseed_1 != nil, {~randseed_1.asString++" entered"}, {"number not entered"});
		randseedviewtext1.align = \topLeft;
		randseedviewtext1.font = Font(size: ~firstviewboundsWIDTH/48);

		randseedviewtext2 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/3.7894736842105,~firstviewboundsHEIGHT/2.6063618290258, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		randseedviewtext2.background=maincolor;
		randseedviewtext2.string = if(~randseed_2 != nil, {~randseed_2.asString++" entered"}, {"number not entered"});
		randseedviewtext2.align = \topLeft;
		randseedviewtext2.font = Font(size: ~firstviewboundsWIDTH/48);

		randseedviewtext3 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/1.8947368421053, ~firstviewboundsHEIGHT/2.6063618290258, ~firstviewboundsWIDTH/4.2352941176471, ~firstviewboundsHEIGHT/21.85));
		randseedviewtext3.background=maincolor;
		randseedviewtext3.string = if(~randseed_3 != nil, {~randseed_3.asString++" entered"}, {"number not entered"});
		randseedviewtext3.align = \topLeft;
		randseedviewtext3.font = Font(size: ~firstviewboundsWIDTH/48);


		firstviewtext3 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.3215725806452, ~firstviewboundsWIDTH/1.0285714285714, ~firstviewboundsHEIGHT/21.85));
		firstviewtext3.background=maincolor;
		firstviewtext3.string = "Or you can do none of that, and autogenerate all of those things by clicking on "++"next".quote++" below...";
		firstviewtext3.align = \topLeft;
		firstviewtext3.font = Font(size: ~firstviewboundsWIDTH/48);

		firstviewnextbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/1.2, ~firstviewboundsHEIGHT/1.2116451016636, ~firstviewboundsWIDTH/12, ~firstviewboundsHEIGHT/10.925)).states_([["next",Color.white,Color.black],["next",Color.white,Color.black]]).action_({arg button;

			if(~randseed_1 == nil, {~randseed_1 =  99999999.rand;});
			if(~randseed_2 == nil, {~randseed_2 =  99999999.rand;});
			if(~randseed_3 == nil, {~randseed_3 =  99999999.rand;});

			if(~startprogram == nil, {~save_random_seeds_func.value; ~startprogram = 1;});

			~main_page_func.value;
		});
		firstviewnextbutton.font = Font(size: ~firstviewboundsWIDTH/48);

	};

	~main_page_func = {var arrow, newrandomseedsbutton, reversenewrandomseedsbutton, currentrandomseedstrext, playnil, see_saved_seeds_file_button;

		~firstview.close;

		~firstview = View(w, Rect(0, 0, w.bounds.width, w.bounds.height));
		/*view.clearOnRefresh = false;*/
		~firstview.background = maincolor;
		~firstviewboundsWIDTH = ~firstview.bounds.width;
		~firstviewboundsHEIGHT = ~firstview.bounds.height;

		firstviewtext1 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/2.2857142857143, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/8, ~firstviewboundsHEIGHT/21.85));
		firstviewtext1.background=maincolor;
		firstviewtext1.string = "Main Page";
		firstviewtext1.align = \topLeft;
		firstviewtext1.font = Font(size: ~firstviewboundsWIDTH/48);

		firstviewtext2 = Button.new(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/16, ~firstviewboundsHEIGHT/21.85)).states_([["back",Color.white,Color.black],["back",Color.white,Color.black]]).action_({arg button;
			~firstview.close;
			~front_page_func.value;
		});
		firstviewtext2.background=Color.grey;
		firstviewtext2.string = "back";
		firstviewtext2.font = Font(size: ~firstviewboundsWIDTH/48);

		firstviewtext3 = Button.new(~firstview, Rect(~firstviewboundsWIDTH/1.3584905660377, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/4, ~firstviewboundsHEIGHT/21.85)).states_([["click here for instructions",Color.white,Color.black],["click here for instructions",Color.white,Color.black]]).action_({arg button;
			~instructions_page_func.value;

		});
		firstviewtext3.font = Font(size: ~firstviewboundsWIDTH/48);

		generatepiecebutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/6.5454545454545, ~firstviewboundsHEIGHT/21.85)).states_([["generate piece",Color.white,Color.black],["generate piece",Color.white,Color.black]]).action_({arg button;
			var piecegenerated;
			~piecegenerated = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsWIDTH/7.8, ~firstviewboundsWIDTH/6.2608695652174, ~firstviewboundsWIDTH/36));
			~piecegenerated.background=maincolor;
			"please wait".postln;
			~piecegenerated.font = Font(size: ~firstviewboundsWIDTH/55);
			~piecegenerated.string = "please wait";
			if(~piece_created == "true", {~playbutton.close; ~arrow.close;});
			~piece_generator_func.value;

		});
		generatepiecebutton.font = Font(size: ~firstviewboundsWIDTH/48);

		/*if(playnil == nil, {nil}, {*/
		/*~play_visible_func = {
		~play_visible_func_verify*/

		~playbutton_func = {
			~playbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/5.1063829787234, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/8, ~firstviewboundsHEIGHT/21.85)).states_([["play piece",Color.white,Color.black],["stop piece",Color.white,Color.black]]).action_({arg button;
				if(button.value == 1, {
					~pausebuttonfunc.value;
					~run_piece_func.value;
				}, {
					~duranduranbotsynth1.free;
					~duranduranbotsynth2.free;
					~duranduranbotsynth3.free;
					~timer_routine.stop;
					~duranduranbot_routine.stop;
					q = FileReader.read(Document.current.dir++"/other_program_files/ddbot_machine_learning_on_off.scd");
					2.do({q = q.at(0)});
					q = q.asInteger;
					if(q == 1, {~machine_learning_func.value;});
					Server.freeAll;
					~pausebutton.close;
					"piece stopped".postln;
					if(~will_record == 1, {s.stopRecording;});
					~fullpiecedur2 = ~fullpiecedur;
				});

			});
			~playbutton.font = Font(size: ~firstviewboundsWIDTH/48);
			/*};*/
			~arrow = StaticText(~firstview, Rect(~firstviewboundsWIDTH/5.9016393442623, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/36, ~firstviewboundsHEIGHT/21.85));
			~arrow.background=maincolor;
			~arrow.string = "---";
			~arrow.font = Font(size: ~firstviewboundsWIDTH/48);
		};

		~playbutton_func.value;

		if(~piece_created == nil, {~playbutton.close; ~arrow.close;});

		~pausebuttonfunc = {~pausebutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/3.063829787234, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/8, ~firstviewboundsHEIGHT/21.85)).states_([["pause piece",Color.white,Color.black],["resume",Color.white,Color.black]]).action_({arg button;
			if(button.value == 1, {
				~timer_routine.pause;
				~duranduranbot_routine.pause;
				s.makeBundle(s.latency, {
					~duranduranbotsynth1.set(\freq, 0);
					~duranduranbotsynth2.set(\freq, 0);
					~duranduranbotsynth3.set(\freq, 0);
				});
				"piece paused".postln;
				if(~will_record == 1, {s.pauseRecording;});
			}, {~timer_routine.resume; ~duranduranbot_routine.resume; "piece resumed".postln; if(~will_record == 1, {s.record;});});
		});

		~pausebutton.font = Font(size: ~firstviewboundsWIDTH/48);
		};

		if(~duranduranbot_routine.isPlaying == true, {~playbutton.value = 1; ~pausebuttonfunc.value;}, {~playbutton.value = 0});

		recordbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/2.8, ~firstviewboundsWIDTH/9, ~firstviewboundsHEIGHT/21.85)).states_([["record off",Color.white,Color.black],["record on",Color.black,Color.red]]).action_({arg button;
			if(button.value == 1, {
				~recordtext.string = "upon pressing "++"play piece".quote++"piece WILL be recorded";
				~will_record = 1;
			}, {~recordtext.string = "upon pressing "++"play piece".quote++"piece will NOT be recorded"; ~will_record = 0;});

		});
		recordbutton.font = Font(size: ~firstviewboundsWIDTH/48);

		~recordtext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/2.45, ~firstviewboundsWIDTH/2.2, ~firstviewboundsHEIGHT/21.85));
		~recordtext.background=Color.white;
		~recordtext.string = "upon pressing "++"play piece".quote++" piece will NOT be recorded";
		~recordtext.font = Font(size: ~firstviewboundsWIDTH/55);

		if(~will_record == 1, {~recordtext.string = "upon pressing "++"play piece".quote++"piece WILL be recorded"; recordbutton.value = 1;},
			{~recordtext.string = "upon pressing "++"play piece".quote++"piece will NOT be recorded"; recordbutton.value = 0;});

		piecedurationstatictext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.9422222222222 /*~firstviewboundsHEIGHT/6.2428571428571*/, ~firstviewboundsWIDTH/2.7, ~firstviewboundsHEIGHT/21.85));
		piecedurationstatictext.background=Color.white;
		piecedurationstatictext.string = if(~fullpiecedur != nil, {~fullpiecedur}, {"piece length - --:-- mins"});
		piecedurationstatictext.font = Font(size: ~firstviewboundsWIDTH/48);

		newrandomseedsbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/1.4173228346457, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/5.1428571428571, ~firstviewboundsHEIGHT/21.85)).states_([["new random seeds",Color.white,Color.black],["new random seeds",Color.white,Color.black]]).action_({arg button;
			~randseed_1_backup = ~randseed_1;
			~randseed_2_backup = ~randseed_2;
			~randseed_3_backup = ~randseed_3;
			~randseed_1 =  99999999.rand;
			~randseed_2 =  99999999.rand;
			~randseed_3 =  99999999.rand;
			~save_random_seeds_func.value;
			z = "Current random seeds:\n"++
			"randseed 1 - "++~randseed_1++"\n"++
			"randseed 2 - "++~randseed_2++"\n"++
			"randseed 3 - "++~randseed_3.asString++
			"\n(also posted in post window)"++"\n"++
			"*make sure to hit "++"generate piece".quote++" to generate a new piece based on the new seeds";
			z.postln;
			currentrandomseedstrext.string = z;

		});
		newrandomseedsbutton.font = Font(size: ~firstviewboundsWIDTH/48);

		reversenewrandomseedsbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/1.1059907834101, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/12, ~firstviewboundsHEIGHT/21.85)).states_([["revert",Color.white,Color.black],["revert",Color.white,Color.black]]).action_({arg button;
			~randseed_1_backup2 = ~randseed_1;
			~randseed_2_backup2 = ~randseed_2;
			~randseed_3_backup2 = ~randseed_3;
			~randseed_1 =  ~randseed_1_backup;
			~randseed_2 =  ~randseed_2_backup;
			~randseed_3 =  ~randseed_3_backup;
			~randseed_1_backup = ~randseed_1_backup2;
			~randseed_2_backup = ~randseed_2_backup2;
			~randseed_3_backup = ~randseed_3_backup2;
			~save_random_seeds_func.value;
			z = "Current random seeds:\n"++
			"randseed 1 - "++~randseed_1++"\n"++
			"randseed 2 - "++~randseed_2++"\n"++
			"randseed 3 - "++~randseed_3.asString++
			"\n(also posted in post window)"++"\n"++
			"*make sure to hit "++"generate piece".quote++" to generate a new piece based on the new seeds";
			z.postln;
			currentrandomseedstrext.string = z;


		});
		reversenewrandomseedsbutton.font = Font(size: ~firstviewboundsWIDTH/48);

		currentrandomseedstrext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/1.4173228346457, ~firstviewboundsHEIGHT/4.6, ~firstviewboundsWIDTH/4, ~firstviewboundsHEIGHT/3.6416666666667));
		currentrandomseedstrext.background=maincolor;
		currentrandomseedstrext.string ="Current random seeds:\n"++
		"randseed 1 - "++~randseed_1++"\n"++
		"randseed 2 - "++~randseed_2++"\n"++
		"randseed 3 - "++~randseed_3.asString++
		"\n(also posted in post window)"++"\n"++
		"*make sure to hit "++"generate piece".quote++" to generate a new piece based on the new seeds";
		currentrandomseedstrext.align = \topLeft;
		currentrandomseedstrext.font = Font(size: ~firstviewboundsWIDTH/58.384615384615);

		see_saved_seeds_file_button = Button.new(~firstview, Rect(~firstviewboundsWIDTH/1.4173228346457, ~firstviewboundsHEIGHT/1.9422222222222, ~firstviewboundsWIDTH/4, ~firstviewboundsHEIGHT/21.85)).states_([["see saved random seeds",Color.white,Color.black],["see saved random seeds",Color.white,Color.black]]).action_({arg button;

			h = Document.open(Document.current.dir++"/duranduranbot_saved_random_seeds.scd");


		});
		see_saved_seeds_file_button.font = Font(size: ~firstviewboundsWIDTH/48);


		machinelearningbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.27, ~firstviewboundsWIDTH/4.3, ~firstviewboundsHEIGHT/21.85)).states_([["machine learning is ON",Color.white,Color.black],["machine learning is OFF",Color.white,Color.black]]).action_({arg button;
			if(button.value == 1, {
				g = File(Document.current.dir++"/other_program_files/ddbot_machine_learning_on_off.scd", "w");
				g.write("0");
				g.close;
			}, {
				g = File(Document.current.dir++"/other_program_files/ddbot_machine_learning_on_off.scd", "w");
				g.write("1");
				g.close;
			});

		});
		machinelearningbutton.font = Font(size: ~firstviewboundsWIDTH/48);

		machinelearningtext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.19, ~firstviewboundsWIDTH/2.1, ~firstviewboundsHEIGHT/21.85));
		machinelearningtext.background=Color.white;
		machinelearningtext.string = "more info about machine learning on "++"instructions".quote++" page";
		machinelearningtext.font = Font(size: ~firstviewboundsWIDTH/55);

		q = FileReader.read(Document.current.dir++"/other_program_files/ddbot_machine_learning_on_off.scd");
		2.do({q = q.at(0)});
		q = q.asInteger;
		if(q == 1, {machinelearningbutton.value = 0;});

	};

	~instructions_page_func = {

		~firstview.close;

		~firstview = View(w, Rect(0, 0, w.bounds.width, w.bounds.height));
		/*view.clearOnRefresh = false;*/
		~firstview.background = maincolor;
		~firstviewboundsWIDTH = ~firstview.bounds.width;
		~firstviewboundsHEIGHT = ~firstview.bounds.height;

		firstviewtext1 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/2.2857142857143, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/8, ~firstviewboundsHEIGHT/21.85));
		firstviewtext1.background=maincolor;
		firstviewtext1.string = "Instructions";
		firstviewtext1.align = \topLeft;
		firstviewtext1.font = Font(size: ~firstviewboundsWIDTH/48);

		firstviewtext2 = Button.new(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/16, ~firstviewboundsHEIGHT/21.85)).states_([["back",Color.white,Color.black],["back",Color.white,Color.black]]).action_({arg button;
			~firstview.close;
			~main_page_func.value;
		});
		firstviewtext2.background=Color.grey;
		firstviewtext2.string = "back";
		firstviewtext2.font = Font(size: ~firstviewboundsWIDTH/48);

		firstviewtext3 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/1.5652173913043, ~firstviewboundsHEIGHT/43.7, ~firstviewboundsWIDTH/2.88, ~firstviewboundsHEIGHT/4.37));
		firstviewtext3.background=maincolor;
		firstviewtext3.string = "*Important Note*... You can kill all sounds and processes by hitting "++"cmd/ctrl - period".quote++"on your keyboard.";
		firstviewtext3.align = \topLeft;
		firstviewtext3.font = Font(size: ~firstviewboundsWIDTH/65.454545454545);

		firstviewtext4 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/1.0285714285714, ~firstviewboundsHEIGHT/0.54625));
		firstviewtext4.background=maincolor;
		firstviewtext4.string =
		"Play a DuranDuranbot piece by clicking the "++"generate piece".quote++"  button on the Main Page, and then by clicking the "++"play piece".quote++"  button. Once random seeds are input into the program on the front page (the very first page of this program), you can only generate a song once using the same random seeds. If you click on the "++"generate piece".quote++"  button more than once without inputting new random seeds the same piece will always be generated. To generate a new piece, you can go back to the first page and input new random seeds, or you can click the "++"new random seeds".quote++"  button across from the "++"generate piece".quote++"  button on the right side of the main page. \n\n You can also input "++"inspiration".quote++" into DuranDuranbot by clicking on the "++"input inspiration into DuranDuranbot".quote++" button on the main page.\n\nMachine learning is enabled by default, but you can disable it on the main page. Using the machine learning function allows for DuranDuranbot to learn what you prefer to hear in a piece by how long you listen to that peice.";
		firstviewtext4.align = \topLeft;
		firstviewtext4.font = Font(size: ~firstviewboundsWIDTH/51.428571428571);

	};

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// SAVE RANDOM SEEDS TO FILE

	~save_random_seeds_func = {

		a = Date.getDate;

		/*Document.open(Document.current.dir++"/duranduranbot_saved_random_seeds.scd").close;*/

		h = File.new(Document.current.dir++"/duranduranbot_saved_random_seeds.scd", "a+");

		h.write("\n\n"++a.asString++
			"\nrandom seed 1 - "++~randseed_1.asString++
			"\nrandom seed 2 - "++~randseed_2.asString++
			"\nrandom seed 3 - "++~randseed_3.asString
		);

		h.close;
	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// MACHINE LEARNING FUNCTION

	~machine_learning_func = {

		~interval_array = (1..12);
		~dna_choice_array = (1..9);
		~net_change = 0.0000001;


		~number_of_instruments.do(r = 0; {
			r=r+1;
			~note_net_points.do({
				~interval_array.size.do(x = (-1); {
					x=x+1;
					if((
						((("inst_"++(r)).asSymbol.envirGet)++"_intvl_weights_count_array").asSymbol.envirGet.at(x) != nil) and: (((("inst_"++(r)).asSymbol.envirGet)++"_intvl_weights_count_array").asSymbol.envirGet.at(x) != [ nil, nil ]), {

						~old_int = ((("inst_"++(r)).asSymbol.envirGet)++"_intvl_weights_count_array").asSymbol.envirGet.at(x).at(0);
						~new_int = ((("inst_"++(r)).asSymbol.envirGet)++"_intvl_weights_count_array").asSymbol.envirGet.at(x).at(1);

						((("inst_"++(r)).asSymbol.envirGet)++"_intvl_"++(~old_int)++"_weights").asSymbol.envirGet.put(~new_int-1, ((("inst_"++(r)).asSymbol.envirGet)++"_intvl_"++(~old_int)++"_weights").asSymbol.envirGet.at(~new_int-1) + ~net_change);
						/*((("inst_"++(r)).asSymbol.envirGet)++"_intvl_"++(~old_int)++"_weights").asSymbol.envirGet.postln;*/
					});
				})
			})
		});


		/*~number_of_instruments.do(x = 0; {
		x=x+1;
		(~interval_array.size+1).do(y = (-1); {
		((("inst_"++(x)).asSymbol.envirGet)++"_intvl_"++(y=y+1)++"_weights").asSymbol.envirPut(Array.fill(~interval_array.size, {1/~interval_array.size}).normalizeSum;);
		});
		});*/

	/*
		y=0;
		x=0;
		3.do({x=x+1;
		12.do(y=(-1);{
		((("inst_"++(x)).asSymbol.envirGet)++"_intvl_"++(y=y+1)++"_weights").asSymbol.envirGet.postln;
		});
		});

		(((("inst_"++(1)).asSymbol.envirGet)++"_intvl_"++(3)++"_weights").asSymbol.envirGet).put(~new_int-1, ((("inst_"++(3)).asSymbol.envirGet)++"_intvl_"++(~old_int)++"_weights").asSymbol.envirGet.at(~new_int-3));

		*/

		~note_net_points.do(x = (-1); {
			~dna_choice_array_weights.put((~dna_index_choice_array.at(x=x+1)-1), ~dna_choice_array_weights.at((~dna_index_choice_array.at(x)-1)) + ~net_change);
		});

		/*~dna_choice_array_weights = Array.fill(9, {1/9}).normalizeSum;*/


		AppClock.sched(0, {
			~interval_array = (1..12);
			~dna_choice_array = (1..9);

			~number_of_instruments.do(x = 0; {
				x=x+1;
				(~interval_array.size+1).do(y = (-1); {
					((("inst_"++(x)).asSymbol.envirGet)++"_intvl_"++(y=y+1)++"_weights").asSymbol.envirPut(((("inst_"++(x)).asSymbol.envirGet)++"_intvl_"++(y)++"_weights").asSymbol.envirGet.normalizeSum;);
				});
			});

			~dna_choice_array_weights = ~dna_choice_array_weights.normalizeSum;

			~number_of_instruments.do(x=0; {
				var write_func;
				write_func = {
					(~interval_array.size+1).do(z = (-1); {
						z=z+1;
						(~interval_array.size).do(s = (-1); {
							g.write((((("inst_"++(x)).asSymbol.envirGet)++"_intvl_"++(z)++"_weights").asSymbol.envirGet.at(s=s+1)).asString++" ")
						});
						g.write("\n");
					});
					g.close;
				};
				x=x+1;
				case
				{(("inst_"++(x)).asSymbol.envirGet) == "bass"}{
					g = File(Document.current.dir++"/other_program_files/ddbot_bass_net_weights.scd", "w");
					write_func.value
				}
				{(("inst_"++(x)).asSymbol.envirGet) == "keys"}{
					g = File(Document.current.dir++"/other_program_files/ddbot_keys_net_weights.scd", "w");
					write_func.value
				}
				{(("inst_"++(x)).asSymbol.envirGet) == "vocal"}{
					g = File(Document.current.dir++"/other_program_files/ddbot_vocal_net_weights.scd", "w");
					write_func.value
				};
			});

			g = File(Document.current.dir++"/other_program_files/ddbot_dna_weights.scd", "w");
			(~dna_choice_array.size-1).do(s = (-1); {g.write(~dna_choice_array_weights.at(s=s+1).asString++" ");});
			g.write(~dna_choice_array_weights.at(s=s+1).asString);
			g.close;
		});
	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// BUILD/GENERATE/COMPOSE PIECE

	~piece_generator_func = {

		(
			(

				~tuning_frequency = 440; //default 440 hz
				~freqmap = (i = ~tuning_frequency / (2 ** (69 / 12)); a = (-1); b = (-1); Array.fill(128, {i * (2 ** (((a=a+1) / 12).trunc)) * ( (2 ** (12.reciprocal)) ** ((b=b+1)  % 12));}));/*~freqmap = (i = 8.0271480262684/*-0.0000000000024*/; ~stepratio = 1.0594630943593; Array.fill(128, { i = i*~stepratio;}));*/
				~freqmap = ~freqmap.cpsmidi;
				/*~freqmap2 = (i = ~freqmap.at(58)/*-0.0000000000024*/; ~stepratio = 1.0594630943593; Array.fill(24, { i = i*~stepratio;}));*/
				~freqmap2 = (n = 54; Array.fill(36, {~freqmap.at(n=n+1);}));
				~time_sig_array1 = [2, 1, 0.5];
				/*~ratio_array = (x = 0; Array.fill(12, {1.0594630943593**(x=x+1)}));*/
				~interval_array = (1..12);
				~midi_ratio_array = (1..12);

				thisThread.randSeed = ~randseed_1;

				~instrument_array = ["bass", "keys", "vocal"];
				~inst_1 = ~instrument_array.removeAt(([0,1,2]).wchoose([0.4,0.4,0.2]));
				~inst_2 = ~instrument_array.removeAt(([0,1]).wchoose(case{~inst_1 == "bass"}{[0.4,0.2]}{~inst_1 == "keys"}{[0.4,0.2]}{~inst_1 == "vocal"}{[0.4,0.4]};));
				~inst_3 = ~instrument_array.removeAt(0);

				~number_of_instruments.do(o=0; {
					h = FileReader.read(Document.current.dir++"/other_program_files/ddbot_"++(("inst_"++(o=o+1)).asSymbol.envirGet).asString++"_net_weights.scd", false, true);
					(~interval_array.size+1).do(z = (-1); {((("inst_"++(o)).asSymbol.envirGet)++"_intvl_"++(z=z+1)++"_weights").asSymbol.envirPut(h.at(z));});
					(~interval_array.size+1).do(z = (-1); {((("inst_"++(o)).asSymbol.envirGet)++"_intvl_"++(z=z+1)++"_weights").asSymbol.envirPut(((("inst_"++(o)).asSymbol.envirGet)++"_intvl_"++(z)++"_weights").asSymbol.envirGet.asFloat.normalizeSum;)});
					(~interval_array.size+1).do(z = (-1); {((("inst_"++(o)).asSymbol.envirGet)++"_intvl_"++(z=z+1)++"_weights").asSymbol.envirGet.removeAt(12)});
				});

				h = FileReader.read(Document.current.dir++"/other_program_files/ddbot_dna_weights.scd", false, true);
				~dna_choice_array_weights = h.flatten.asFloat.normalizeSum;

				~song_dna_array_num = (1..12).choose;
				~dna_choice_array = (1..9);
				~dna_choice_array2 = ~dna_choice_array;
				~song_dna_array_num.do(~song_dna_array = []; x = (-1); {
					~song_dna_array = ~song_dna_array.add(~dna_choice_array.wrapAt(x=x+(~dna_choice_array.wchoose(~dna_choice_array_weights))));
				});

				(~song_dna_array.size).do(~song_dna_array_SUM = 0; x = (-1); {~song_dna_array_SUM = ~song_dna_array_SUM + ~song_dna_array.at(x=x+1);});
				~dna_x = (-1);
				~dna_index_choice_func = {~song_dna_array.at(if(~dna_x < (~song_dna_array.size-1), {~dna_x=~dna_x+1;}, {~dna_x = 0}))};
				~dna_index_choice = ~dna_index_choice_func.value;
				~dna_clock_y = 0;
				~midi_ratio_x = 0;


				//empties arrays after pre-generation of piece also
				~dna_index_choice_array = [];
				~number_of_instruments.do(x = 0; {((("inst_"++(x=x+1)).asSymbol.envirGet)++"_intvl_weights_count_array").asSymbol.envirPut([]);});

				x = 0;
				~inst_array = Array.fill(~number_of_instruments, {x=x+1});

				~inst_clock_func = {

					if(~dna_clock_y == ~dna_index_choice.asInteger, {
						~put_x = ([1,2,3]).wchoose([1/3,1/3,1/3]);
						case
						{~put_x == 1}{

							("instrument_"++(~inst_num)++"_if_zero").asSymbol.envirPut("false");
							~interval = ("instrument_"++(~inst_array.wrapAt(~inst_num-2))++"_freq").asSymbol.envirGet - ("instrument_"++(~inst_array.wrapAt(~inst_num-3))++"_freq").asSymbol.envirGet;
							if(~interval.isNegative == true, {~interval = ~interval.neg});
							while({~interval > 12}, {~interval = ~interval - 12});
							~new_interval = ~interval_array.wchoose(((("inst_"++(~inst_num)).asSymbol.envirGet)++"_intvl_"++(~interval)++"_weights").asSymbol.envirGet;);
							~interval_choice = ~new_interval;

							((("inst_"++(~inst_num)).asSymbol.envirGet)++"_interval").asSymbol.envirPut(~interval);
							((("inst_"++(~inst_num)).asSymbol.envirGet)++"_new_interval").asSymbol.envirPut(~interval_choice);

							~new_interval = [~new_interval, ~new_interval.neg].choose;
							("instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet + ~new_interval);

							if(((("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet > 90) or: (("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet < 55)), {
								while({("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet > 90}, {("instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet-12)});
								while({("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet < 55}, {("instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet+12)});
							});

							~put1 = ("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet;
						}

						{~put_x == 2}{

							("instrument_"++(~inst_num)++"_if_zero").asSymbol.envirPut("false");

							~put1 = ("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet;
						}

						{~put_x == 3}{

							("instrument_"++(~inst_num)++"_if_zero").asSymbol.envirPut("true");

							~put1 = 0;
						}

					},
					{
						~put1 = if(("instrument_"++(~inst_num)++"_if_zero").asSymbol.envirGet == "false", {("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet;}, {0});

					});

					/*~keys_intvl_weights_count_array*/

					((("inst_"++(~inst_num)).asSymbol.envirGet)++"_intvl_weights_count_array").asSymbol.envirPut(
						((("inst_"++(~inst_num)).asSymbol.envirGet)++"_intvl_weights_count_array").asSymbol.envirGet.add(
							case
							{(~put_x == 1) or: (~put_x == 2)}{[((("inst_"++(~inst_num)).asSymbol.envirGet)++"_interval").asSymbol.envirGet, ((("inst_"++(~inst_num)).asSymbol.envirGet)++"_new_interval").asSymbol.envirGet]}
							{~put_x == 3}{nil};
						);
					);

					~dna_index_choice_array = ~dna_index_choice_array.add(~dna_index_choice);

					~put1.value;
				};



				~number_of_instruments.do(x = 0; {
					x=x+1;
					~number_of_parts_in_piece.do(y = 0; {("instrument_"++(x)++"_array_part_"++(y=y+1)).asSymbol.envirPut([]);});
				});


				~instrument_1_array_starting_func = {

					(~number_of_instruments-1).do(x = 0; {("instrument_"++(x=x+1)++"_if_zero").asSymbol.envirPut("false");});

					("instrument_1_array_part_"++(~part_num)).asSymbol.envirPut(
						("instrument_1_array_part_"++(~part_num)).asSymbol.envirGet.add(~instrument_1_freq = ~freqmap2.choose)
					);

					(~number_of_instruments-1).do(x = 1; {("instrument_"++(x=x+1)++"_freq").asSymbol.envirPut(~instrument_1_freq);});
				};

				~instrument_1_array_func = {
					("instrument_1_array_part_"++(~part_num)).asSymbol.envirPut(
						("instrument_1_array_part_"++(~part_num)).asSymbol.envirGet.add(
							case
							{~inst_1 == "bass"}{~inst_num = 1; ~inst_clock_func.value;}
							{~inst_1 == "keys"}{~inst_num = 1; ~inst_clock_func.value;}
							{~inst_1 == "vocal"}{~inst_num = 1; ~inst_clock_func.value;};
					));
				};

				~instrument_2_array_func = {
					("instrument_2_array_part_"++(~part_num)).asSymbol.envirPut(
						("instrument_2_array_part_"++(~part_num)).asSymbol.envirGet.add(
							case
							{~inst_2 == "bass"}{~inst_num = 2; ~inst_clock_func.value;}
							{~inst_2 == "keys"}{~inst_num = 2; ~inst_clock_func.value;}
							{~inst_2 == "vocal"}{~inst_num = 2; ~inst_clock_func.value;};
					));
				};

				~instrument_3_array_func = {
					("instrument_3_array_part_"++(~part_num)).asSymbol.envirPut(
						("instrument_3_array_part_"++(~part_num)).asSymbol.envirGet.add(

							case
							{~inst_3 == "bass"}{~inst_num = 3; ~inst_clock_func.value;}
							{~inst_3 == "keys"}{~inst_num = 3; ~inst_clock_func.value;}
							{~inst_3 == "vocal"}{~inst_num = 3; ~inst_clock_func.value;};
					));
				};

			);

			//Piece creation in parts. Only reason to have parts is to determine length of piece.

			//Piece creation is like human life. Pre-birth... then birth.... then etc...

			(

				~create_piece_function = {

					thisThread.randSeed = ~randseed_2;

					~part_bit_size = 64;
					~bit_duration = rrand(0.01, 0.2); //ALWAYS keep bit_duration same throughout entire piece.
					~max_number_of_parts = 100; //max 100 parts. random probability choice decreases linearly from "~max_number_of_parts" value to 1.
					~number_of_parts_in_piece = (~max_number_of_parts.linrand - ~max_number_of_parts).neg;/*
					("piece duration: \n"++(~number_of_parts_in_piece*~part_bit_size*~bit_duration/60)++" minutes").postln;*/

					~create_piece_routine = Routine({

						thisThread.randSeed = ~randseed_3;

						//pre-generation of piece

						1.do({~part_num = 0;

							1.do({

								~dna_clock_y = ~dna_clock_y + 1;
								~midi_ratio_x = ~midi_ratio_x + 1;

								~instrument_1_array_starting_func.value;
								~instrument_2_array_func.value;
								~instrument_3_array_func.value;

								if(~dna_clock_y == ~dna_index_choice.asInteger, {~dna_clock_y = 0; ~dna_index_choice = ~dna_index_choice_func.value;});
								if(~midi_ratio_x == (~midi_ratio_array.size-1), {~midi_ratio_x = 0});

								/*~instrument_1_freq.postln;
								~instrument_2_freq.postln;
								~instrument_3_freq.postln;*/

							});

							(~song_dna_array_SUM-1).do({

								~dna_clock_y = ~dna_clock_y + 1;
								~midi_ratio_x = ~midi_ratio_x + 1;

								~instrument_1_array_func.value;
								~instrument_2_array_func.value;
								~instrument_3_array_func.value;

								if(~dna_clock_y == ~dna_index_choice.asInteger, {~dna_clock_y = 0; ~dna_index_choice = ~dna_index_choice_func.value;});
								if(~midi_ratio_x == (~midi_ratio_array.size-1), {~midi_ratio_x = 0});

								/*~instrument_1_freq.postln;
								~instrument_2_freq.postln;
								~instrument_3_freq.postln;*/

							});
						});

						~number_of_instruments.do(x = 0; {
							x=x+1;
							~number_of_parts_in_piece.do(y = 0; {("instrument_"++(x)++"_array_part_"++(y=y+1)).asSymbol.envirPut([]);});
						});

						~dna_index_choice_array = [];
						~number_of_instruments.do(x = 0; {((("inst_"++(x=x+1)).asSymbol.envirGet)++"_intvl_weights_count_array").asSymbol.envirPut([]);});

						/*~sldkjfd = [~instrument_1_freq, ~instrument_2_freq, ~instrument_3_freq].midicps;*/

						//generation of piece

						z = 0;
						(~number_of_parts_in_piece).do({

							1.do({~part_num = z=z+1;

								~part_bit_size.do({

									~dna_clock_y = ~dna_clock_y + 1;
									~midi_ratio_x = ~midi_ratio_x + 1;

									~instrument_1_array_func.value;
									~instrument_2_array_func.value;
									~instrument_3_array_func.value;

									if(~dna_clock_y == ~dna_index_choice.asInteger, {~dna_clock_y = 0; ~dna_index_choice = ~dna_index_choice_func.value;});
									if(~midi_ratio_x == (~midi_ratio_array.size-1), {~midi_ratio_x = 0});

								});
							});

						});


						//create pseq arrays function

						(
							~create_pseq_arrays_func = {

								h = 0.midicps;

								1.do({

									~instrument_1_full_pseq_array = [];
									~instrument_2_full_pseq_array = [];
									~instrument_3_full_pseq_array = [];

									x = 0;
									~number_of_parts_in_piece.do({~instrument_1_full_pseq_array = ~instrument_1_full_pseq_array.add(("instrument_1_array_part_"++(x=x+1)).asSymbol.envirGet);});
									~instrument_1_full_pseq_array = ~instrument_1_full_pseq_array.flatten;
									~instrument_1_full_pseq_array = ~instrument_1_full_pseq_array.midicps;
									~instrument_1_full_pseq_array = ~instrument_1_full_pseq_array.replace(h, 0);/*
									~instrument_1_full_pseq_array_mirrored = ~instrument_1_full_pseq_array*1.4142135623729;*/

									x = 0;
									~number_of_parts_in_piece.do({~instrument_2_full_pseq_array = ~instrument_2_full_pseq_array.add(("instrument_2_array_part_"++(x=x+1)).asSymbol.envirGet);});
									~instrument_2_full_pseq_array = ~instrument_2_full_pseq_array.flatten;
									~instrument_2_full_pseq_array = ~instrument_2_full_pseq_array.midicps;
									~instrument_2_full_pseq_array = ~instrument_2_full_pseq_array.replace(h, 0);/*
									~instrument_2_full_pseq_array_mirrored = ~instrument_2_full_pseq_array*1.4142135623729;*/

									x = 0;
									~number_of_parts_in_piece.do({~instrument_3_full_pseq_array = ~instrument_3_full_pseq_array.add(("instrument_3_array_part_"++(x=x+1)).asSymbol.envirGet);});
									~instrument_3_full_pseq_array = ~instrument_3_full_pseq_array.flatten;
									~instrument_3_full_pseq_array = ~instrument_3_full_pseq_array.midicps;
									~instrument_3_full_pseq_array = ~instrument_3_full_pseq_array.replace(h, 0);/*
									~instrument_3_full_pseq_array_mirrored = ~instrument_3_full_pseq_array*1.4142135623729;*/

									"Piece Creation Is Finsihed".postln;

									if(~piece_created == nil, {~piece_created = "true";});
									AppClock.sched(0, {
										~playbutton_func.value;
										~piecegenerated.string = "piece generated";
										AppClock.sched(3, {~piecegenerated.close});
									});

									AppClock.sched(0, {
										~fullpiecedur1 = (~number_of_parts_in_piece*~part_bit_size*~bit_duration/60);
										~dd_secs = ((~fullpiecedur1-(~dd_mins = ~fullpiecedur1.roundUp-1))*60).roundUp;
										~fullpiecedur = ("piece length - "++(~dd_mins.asString)++":"++(if(~dd_secs<10,{"0"},{""})++~dd_secs.asString)++" mins");
										piecedurationstatictext.string = ~fullpiecedur;
										("\npiece duration: \n"++((~dd_mins.asString)++":"++(if(~dd_secs<10,{"0"},{""})++~dd_secs.asString))++" minutes";).postln;


									});
								});
							};

							~create_pseq_arrays_func.value;
						);

					});

					~create_piece_routine.play;
				};

				~create_piece_function.value;

			);

			/*~create_piece_routine.isPlaying*/

		);
	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// RUN/PLAY PIECE

	~run_piece_func = {

		(

			~klangarray1 = Array.rand(3, 0, 20);
			~klangarray2 = Array.rand(3, 0, 20);
			~klangarray3 = Array.rand(3, 0, 20);
			~klangarray4 = Array.rand(3, 0, 20);

			SynthDef(\synth1, {arg freq = 432, freq1 = 60, amp = 0.1, detun = 1.006, ffreq = 800, rq = 1, gt = 1;
				var sig;
				sig = Mix(DynKlang.ar(`[ [freq]++~klangarray1+freq, nil, nil ], 1, 0) * 0.05);
				sig = RLPF.ar(sig, ffreq, rq);
				sig = sig * EnvGen.kr(
					Env.adsr(0.01, 0.1, 0.6, 0.1),
					gt
				);

				Out.ar(0, sig!2);
			}).add;
			SynthDef(\synth2, {arg freq = 432, freq1 = 60, amp = 0.1, detun = 1.006, ffreq = 800, rq = 1, gt = 1;
				var sig;
				sig = Mix(DynKlang.ar(`[ [freq]++~klangarray2+freq, nil, nil ], 1, 0) * 0.05);
				sig = RLPF.ar(sig, ffreq, rq);
				sig = sig * EnvGen.kr(
					Env.adsr(0.01, 0.1, 0.6, 0.1),
					gt
				);

				Out.ar(0, sig!2);
			}).add;
			SynthDef(\synth3, {arg freq = 432, freq1 = 60, amp = 0.1, detun = 1.006, ffreq = 800, rq = 1, gt = 1;
				var sig;
				sig = Mix(DynKlang.ar(`[ [freq]++~klangarray3+freq, nil, nil ], 1, 0) * 0.05);
				sig = RLPF.ar(sig, ffreq, rq);
				sig = sig * EnvGen.kr(
					Env.adsr(0.01, 0.1, 0.6, 0.1),
					gt
				);

				Out.ar(0, sig!2);
			}).add;


			/*SynthDef(\bass_synth1, {arg freq = 432, freq1 = 60, amp = 0.1, detun = 1.006, ffreq = 800, rq = 1, gt = 1;
			var sig;
			sig = Mix(DynKlang.ar(`[ [freq]++~klangarray1+freq, nil, nil ], 1, 0) * 0.05);
			sig = RLPF.ar(sig, ffreq, rq);
			sig = sig * EnvGen.kr(
			Env.adsr(0.01, 0.1, 0.6, 0.1),
			gt
			);

			Out.ar(0, sig!2);
			}).add;
			SynthDef(\keys_synth2, {arg freqa = 432, freqb = 432, freq1 = 60, amp = 0.1, detun = 1.006, ffreq = 800, rq = 1, gt = 1;
			var sig;
			sig = Mix([DynKlang.ar(`[ [freqa]++~klangarray2+freqa, nil, nil ], 1, 0), DynKlang.ar(`[ [freqb]++~klangarray2+freqb, nil, nil ], 1, 0)]  * 0.05);
			sig = RLPF.ar(sig, ffreq, rq);
			sig = sig * EnvGen.kr(
			Env.adsr(0.01, 0.1, 0.6, 0.1),
			gt
			);

			Out.ar(0, sig!2);
			}).add;

			/*Synth(\keys_synth2, [\freqa, 432, \freqb, 300])*/

			SynthDef(\vocal_synth3, {arg freq = 432, freq1 = 60, amp = 0.1, detun = 1.006, ffreq = 800, rq = 1, gt = 1;
			var sig;
			sig = Mix(DynKlang.ar(`[ [freq]++~klangarray3+freq, nil, nil ], 1, 0) * 0.05);
			sig = RLPF.ar(sig, ffreq, rq);
			sig = sig * EnvGen.kr(
			Env.adsr(0.01, 0.1, 0.6, 0.1),
			gt
			);

			Out.ar(0, sig!2);
			}).add;*/

			/*b = Buffer.read(s, Document.current.dir++"/samples/Alesis-Sanctuary-QCard-Promenade-C3-loop5.wav");

			~synth = {
			SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0, freq = 1 |
			Out.ar(out,
			(PlayBuf.ar(1, b, BufRateScale.kr(bufnum)*freq, startPos: 0, loop: 1))!2
			)
			}).play(s, [\out, 0]);
			};

			~synth = {
			SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0, s1,s2,s3,s4, freq1 = 1, freq2 = 1.3, freq3 = 1.5 |
			s1 = PlayBuf.ar(1, b, BufRateScale.kr(bufnum)*freq1, startPos: 0, loop: 1);
			s2 = PlayBuf.ar(1, b, BufRateScale.kr(bufnum)*freq2, startPos: 0, loop: 1);
			s3 = PlayBuf.ar(1, b, BufRateScale.kr(bufnum)*freq3, startPos: 0, loop: 1);
			s4 = Mix.new([s1, s2, s3]);
			Out.ar(out, s4!2);
			}).play(s, [\out, 0]);
			};*/

			/*
			~duranduranbotsynth1 = ~synth.value;
			~duranduranbotsynth2 = ~synth.value;
			~duranduranbotsynth3 = ~synth.value;

			~duranduranbotsynth1.set(\freq, 2);
			*/

			~timer_routine = Task(
				~dd_secs = ((~fullpiecedur1-(~dd_mins = ~fullpiecedur1.roundUp-1))*60).roundUp;
				{
					inf.do({
						AppClock.sched(0, {
							piecedurationstatictext.string = ("piece length - "++(~dd_mins.asString)++":"++(if(~dd_secs<10,{"0"},{""})++~dd_secs.asString)++" mins");
							~dd_secs = ~dd_secs-1;
							if(~dd_secs == (-1), {~dd_mins = ~dd_mins-1; ~dd_secs = 59;});
						});

						1.wait;
					});
			});

			s = Server.default;

			~note_net_points = 0;

			~duranduranbot_routine = Task({i = 0;

				1.do({

					if(~will_record == 1, {
						thisProcess.platform.recordingsDir = (Document.current.dir++"/other_stuff_(recordings_etc)/duranduranbot_recordings");
						s.record;
						1.wait;
					});

					"piece currently running".postln;

					s.makeBundle(s.latency, {

						~duranduranbotsynth1 = Synth(
							(
								case
								{~inst_1 == "bass"}{\synth1}
								{~inst_1 == "keys"}{\synth2}
								{~inst_1 == "vocal"}{\synth3};
						), [freq: ~instrument_1_full_pseq_array.at(i)]);

						~duranduranbotsynth2 = Synth(
							(
								case
								{~inst_2 == "bass"}{\synth1}
								{~inst_2 == "keys"}{\synth2}
								{~inst_2 == "vocal"}{\synth3};
						), [freq: ~instrument_2_full_pseq_array.at(i)]);

						~duranduranbotsynth3 = Synth(
							(
								case
								{~inst_3 == "bass"}{\synth1}
								{~inst_3 == "keys"}{\synth2}
								{~inst_3 == "vocal"}{\synth3};
						), [freq: ~instrument_3_full_pseq_array.at(i)]);



						/*~duranduranbotsynth1_m = Synth(
						(
						case
						{~inst_1 == "bass"}{\synth1}
						{~inst_1 == "keys"}{\synth2}
						{~inst_1 == "vocal"}{\synth3};
						), [freq: ~instrument_1_full_pseq_array_mirrored.at(i)]);
						~duranduranbotsynth2_m = Synth(
						(
						case
						{~inst_2 == "bass"}{\synth1}
						{~inst_2 == "keys"}{\synth2}
						{~inst_2 == "vocal"}{\synth3};
						), [freq: ~instrument_2_full_pseq_array_mirrored.at(i)]);
						~duranduranbotsynth3_m = Synth(
						(
						case
						{~inst_3 == "bass"}{\synth1}
						{~inst_3 == "keys"}{\synth2}
						{~inst_3 == "vocal"}{\synth3};
						), [freq: ~instrument_3_full_pseq_array_mirrored.at(i)]);*/


						/*~duranduranbotsynth1 = ~synth.value;
						~duranduranbotsynth2 = ~synth.value;
						~duranduranbotsynth3 = ~synth.value;
						~duranduranbotsynth1.set(\freq, ~instrument_1_full_pseq_array.at(x));
						~duranduranbotsynth2.set(\freq, ~instrument_2_full_pseq_array.at(x));
						~duranduranbotsynth3.set(\freq, ~instrument_3_full_pseq_array.at(x));*/
					});

					~note_net_points = ~note_net_points + 1;

					~bit_duration.wait;

				});

				(~instrument_1_full_pseq_array.size-1).do({

					s.makeBundle(s.latency, {
						~duranduranbotsynth1.set(\freq, ~instrument_1_full_pseq_array.at(i=i+1));
						~duranduranbotsynth2.set(\freq, ~instrument_2_full_pseq_array.at(i));
						~duranduranbotsynth3.set(\freq, ~instrument_3_full_pseq_array.at(i));


						/*~duranduranbotsynth1_m.set(\freq, ~instrument_1_full_pseq_array_mirrored.at(i));
						~duranduranbotsynth2_m.set(\freq, ~instrument_2_full_pseq_array_mirrored.at(i));
						~duranduranbotsynth3_m.set(\freq, ~instrument_3_full_pseq_array_mirrored.at(i));
						*/
					});

					~note_net_points = ~note_net_points + 1;

					~bit_duration.wait;

				});

				~duranduranbotsynth1.free;
				~duranduranbotsynth2.free;
				~duranduranbotsynth3.free;
				~timer_routine.stop;
				~duranduranbot_routine.stop;
				"piece finished".postln;
				if(~will_record == 1, {s.stopRecording;});
				q = FileReader.read(Document.current.dir++"/other_program_files/ddbot_machine_learning_on_off.scd");
				2.do({q = q.at(0)});
				q = q.asInteger;
				if(q == 1, {~machine_learning_func.value;});
				Server.freeAll;

			});


			s.makeBundle(s.latency, {
				~timer_routine.start;
				~duranduranbot_routine.start;
			});

		);
	};





	w.front;

	~front_page_func.value;

};

if(Server.default.serverRunning == false, {s.boot; s.waitForBoot({~duranduranbot_GUI_func.value;});}, {~duranduranbot_GUI_func.value;});

/*~duranduranbot_GUI_func.value;*/








/*

// editor preference settings


(Platform.userConfigDir +/+ "sc_ide_conf.yaml").openDocument;

IDE:
editor:
blinkDuration: 600
disableBlinkingCursor: false
font:
antialias: 2
family: Courier 10 Pitch
size: 9
highlightBracketContents: true
highlightCurrentLine: false
inactiveEditorFadeAlpha: 64
indentWidth: 4
insertMatchingTokens: false
lineWrap: false
spaceIndent: false
stepForwardEvaluation: false
theme: My old theme
themes:
My old theme:
built-in: !textFormat
color: "#6b6bbf"
italic: false
char: !textFormat
color: "#92d38e"
italic: false
class: !textFormat
color: "#6066d2"
italic: false
comment: !textFormat
color: "#bf5454"
italic: false
currentLine: !textFormat
color: "#000000"
background: "#f4f4f4"
italic: false
env-var: !textFormat
color: "#8c654f"
italic: false
evaluatedCode: !textFormat
color: "#000000"
background: "#f8a200"
keyword: !textFormat
color: "#676fe6"
bold: true
italic: false
lineNumbers: !textFormat
color: "#6f6f6f"
background: "#000000"
italic: false
matchingBrackets: !textFormat
color: "#ff0000"
bold: true
mismatchedBrackets: !textFormat
color: "#ffffff"
background: "#960000"
italic: false
number: !textFormat
color: "#9d43a7"
italic: false
postwindowemphasis: !textFormat
color: "#edd400"
bold: true
italic: false
postwindowerror: !textFormat
color: "#d11c24"
italic: false
postwindowsuccess: !textFormat
color: "#738a05"
italic: false
postwindowtext: !textFormat
color: "#ffffff"
italic: false
postwindowwarning: !textFormat
color: "#a57706"
italic: false
primitive: !textFormat
color: "#3333bf"
italic: false
searchResult: !textFormat
color: "#7f7f7f"
background: "#783b23"
selection: !textFormat
{}
string: !textFormat
color: "#bababa"
italic: false
symbol: !textFormat
color: "#87c87e"
italic: false
text: !textFormat
color: "#ffffff"
background: "#000000"
whitespace: !textFormat
color: "#7f7f7f"
italic: false
useComboBox: false
useComboBoxWhenSplitting: false
interpreter:
autoStart: true
configFile: ""
runtimeDir: ""
standalone: false
mainWindow:
detached: !QVariantMap
documents-dock: ""
help-dock: AQHZ0MsAAgAAAAAAdAAAAI8AAAKzAAADBAAAAHQAAACtAAACswAAAwQAAAAAAAAAAAWg
post-dock: ""
geometry: AdnQywACAAAAAAAAAAAAGwAABZ8AAAODAAAAAAAAAC8AAAK/AAAChgAAAAACAAAABaA=
state: AAAA/wAAAAD9AAAAAgAAAAAAAAAAAAAAAPwCAAAAAfsAAAAcAGQAbwBjAHUAbQBlAG4AdABzAC0AZABvAGMAawAAAAAA/////wAAAF8A////AAAAAQAAANYAAAMa/AIAAAAC+wAAABIAaABlAGwAcAAtAGQAbwBjAGsAAAAAFgAAAbUAAAATAP////sAAAASAHAAbwBzAHQALQBkAG8AYwBrAQAAABYAAAMaAAAATQD///8AAATJAAADGgAAAAEAAAACAAAAAQAAAAL8AAAAAA==
postWindow:
lineWrap: false
scrollback: 1000
recentDocuments: !QVariantList
- /home/ken/Documents/duranduranbot/duranduranbot_9000/duranduranbot_9000/duranduranbot_9000_PROGRAM/duranduranbot_RUN.scd
- /home/ken/.config/SuperCollider/sc_ide_conf.yaml
- /home/ken/Downloads/timewavesynth.scd
startWithSession: last


*/

);