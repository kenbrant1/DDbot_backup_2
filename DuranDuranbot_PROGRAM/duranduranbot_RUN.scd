(
/*

Hello!

To run this program... simply click once anywhere on this page,
and press "cmd/ctrl - enter" on your keyboard.

And if that does not work for some reason, click on the "Language" tab
above, and click on "Evaluate File".

*/

////////////////////////////////////////////////////////////////////////////////////////

// GUI

if(~number_of_instruments == nil, {~number_of_instruments = 3;}); //do not change
~bit_duration = 1/16;
if(~auto_select_diff == nil, {~auto_select_diff = 10;}); // range of number of seconds to rate a piece from current time backwards

~duranduranbot_GUI_func = {

	var w, /*~firstview,*/ firstviewtext1, firstviewtext2, firstviewtext3, firstviewtext4, firstviewtext5, firstviewtext6, firstviewnextbutton, mainview, mainviewtext, maincolor, randseedEZText1, randseedEZText2, randseedEZText3, randseed_1_make, randseed_2_make, randseed_3_make, randseedviewtext1,randseedviewtext2,
	randseedviewtext3, numerologynameEZText1, numerologynameEZText2, numerologynameEZText3, numerologynameviewtext1, numerologynameviewtext2, numerologynameviewtext3,
	generatepiecebutton, playbutton, enterdatabasebutton, recordbutton, songtitletext, songtitlestatictext, piecedurationstatictext, machinelearningbutton, machinelearningtext,
	onestarbutton,twostarbutton,threestarbutton,fourstarbutton,fivestarbutton, quicknewpiecebutton, quicknewpiecebutton_revert, quicknewpiecewait,
	rate_button_1,rate_button_2,rate_button_3,rate_button_4,rate_button_5,rate_button_6, rate_button,ratepiecetext,ratedonetext, rangeslider,timeslider,timeslidertext,
	rate_selectionstatictext,ctrlperiodtext,
	closeddbotbutton;
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
			~piecegenerated = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/9.5, ~firstviewboundsWIDTH/6.2608695652174, ~firstviewboundsWIDTH/36));
			~piecegenerated.background=maincolor;
			"please wait".postln;
			~piecegenerated.font = Font(size: ~firstviewboundsWIDTH/55);
			~piecegenerated.string = "please wait";/*
			if(~piece_created == "true", {~playbutton.close; ~arrow.close;});*/
			~piece_generator_func.value;

		});
		generatepiecebutton.font = Font(size: ~firstviewboundsWIDTH/48);

		/*if(playnil == nil, {nil}, {*/
		/*~play_visible_func = {
		~play_visible_func_verify*/

		~playbutton_func = {
			~playbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/5.1063829787234, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/8, ~firstviewboundsHEIGHT/21.85)).states_([["play piece",Color.white,Color.black],["pause piece",Color.white,Color.black]]).action_({arg button;
				var pause_piece;
				if(button.value == 1, {
					if(~pause_piece != 1, {
						~seedscheck = 1;
						~stopbuttonfunc.value;
						~run_piece_func.value;
					}, {/*~timer_routine.resume;*/ ~duranduranbot_routine.resume; "piece resumed".postln; if(~will_record == 1, {s.record;});});
					~pause_piece = 0;
				}, {
					/*~timer_routine.pause;*/
					~duranduranbot_routine.pause;
					Server.default.makeBundle(Server.default.latency, {~number_of_instruments.do(x = 0; {("duranduranbotsynth"++(x=x+1)).asSymbol.envirGet.set(\freq, 0);});});
					"piece paused".postln;
					if(~will_record == 1, {s.pauseRecording;});
					~pause_piece = 1;
					~playbutton.string = "resume";
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
		if(~pause_piece == 1, {~playbutton.string = "resume"; ~stopbuttonfunc.value;});

		if(~piece_created == nil, {~playbutton.close; ~arrow.close;});

		~stop_func = {
			Server.default.makeBundle(Server.default.latency, {~number_of_instruments.do(x = 0; {("duranduranbotsynth"++(x=x+1)).asSymbol.envirGet.free;});});
			/*~timer_routine.stop;*/
			~duranduranbot_routine.stop;
			~piece_position = 0;
			timeslider.valueAction = 0;
			Server.freeAll;
			"piece stopped".postln;
			if(~will_record == 1, {s.stopRecording;});
			~fullpiecedur2 = ~fullpiecedur;
			~stopbutton.close;
			~playbutton.value = 0;
			~pause_piece = 0;
			~playbutton.string = "play piece";
		};

		~stopbuttonfunc = {~stopbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/3.063829787234, ~firstviewboundsHEIGHT/6.2428571428571, ~firstviewboundsWIDTH/8, ~firstviewboundsHEIGHT/21.85)).states_([["stop piece",Color.white,Color.black]]).action_({arg button;
			~stop_func.value;
		});

		~stopbutton.font = Font(size: ~firstviewboundsWIDTH/48);
		};

		if(~duranduranbot_routine.isPlaying == true, {~playbutton.value = 1; ~stopbuttonfunc.value}, {~playbutton.value = 0});

		~net_change_mult_array = [2, 4, 6, 8, 12];

		rate_button_1 = Button.new(~firstview, Rect(~firstviewboundsWIDTH/9.88, ~firstviewboundsHEIGHT/3.228571428571, ~firstviewboundsWIDTH/12, ~firstviewboundsHEIGHT/21.85)).states_([["x2 pts",Color.white,Color.black], ["x2 pts",Color.black,Color.green]]).action_({arg button;
			~net_change_mult = ~net_change_mult_array.at(0);
			rate_button_1.value = 1;
			rate_button_2.value = 0;
			rate_button_3.value = 0;
			rate_button_4.value = 0;
			rate_button_5.value = 0;
		});
		rate_button_1.font = Font(size: ~firstviewboundsWIDTH/48);

		rate_button_2 = Button.new(~firstview, Rect(~firstviewboundsWIDTH/5.29, ~firstviewboundsHEIGHT/3.228571428571, ~firstviewboundsWIDTH/12, ~firstviewboundsHEIGHT/21.85)).states_([["x4 pts",Color.white,Color.black], ["x4 pts",Color.black,Color.green]]).action_({arg button;
			~net_change_mult = ~net_change_mult_array.at(1);
			rate_button_1.value = 0;
			rate_button_2.value = 1;
			rate_button_3.value = 0;
			rate_button_4.value = 0;
			rate_button_5.value = 0;
		});
		rate_button_2.font = Font(size: ~firstviewboundsWIDTH/48);

		rate_button_3 = Button.new(~firstview, Rect(~firstviewboundsWIDTH/3.62, ~firstviewboundsHEIGHT/3.228571428571, ~firstviewboundsWIDTH/12, ~firstviewboundsHEIGHT/21.85)).states_([["x6 pts",Color.white,Color.black], ["x6 pts",Color.black,Color.green]]).action_({arg button;
			~net_change_mult = ~net_change_mult_array.at(2);
			rate_button_1.value = 0;
			rate_button_2.value = 0;
			rate_button_3.value = 1;
			rate_button_4.value = 0;
			rate_button_5.value = 0;
		});
		rate_button_3.font = Font(size: ~firstviewboundsWIDTH/48);

		rate_button_4 = Button.new(~firstview, Rect(~firstviewboundsWIDTH/2.75, ~firstviewboundsHEIGHT/3.228571428571, ~firstviewboundsWIDTH/12, ~firstviewboundsHEIGHT/21.85)).states_([["x8 pts",Color.white,Color.black], ["x8 pts",Color.black,Color.green]]).action_({arg button;
			~net_change_mult = ~net_change_mult_array.at(3);
			rate_button_1.value = 0;
			rate_button_2.value = 0;
			rate_button_3.value = 0;
			rate_button_4.value = 1;
			rate_button_5.value = 0;
		});
		rate_button_4.font = Font(size: ~firstviewboundsWIDTH/48);

		rate_button_5 = Button.new(~firstview, Rect(~firstviewboundsWIDTH/2.2, ~firstviewboundsHEIGHT/3.228571428571, ~firstviewboundsWIDTH/12, ~firstviewboundsHEIGHT/21.85)).states_([["x12 pts",Color.white,Color.black], ["x12 pts",Color.black,Color.green]]).action_({arg button;
			~net_change_mult = ~net_change_mult_array.at(4);
			rate_button_1.value = 0;
			rate_button_2.value = 0;
			rate_button_3.value = 0;
			rate_button_4.value = 0;
			rate_button_5.value = 1;
		});
		rate_button_5.font = Font(size: ~firstviewboundsWIDTH/48);

		rate_button = Button.new(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/3.228571428571, ~firstviewboundsWIDTH/12, ~firstviewboundsHEIGHT/21.85)).states_([["Rate",Color.white,Color.black]]).action_({arg button;

			q = FileReader.read(Document.current.dir++"/other_program_files/ddbot_machine_learning_on_off.scd");
			2.do({q = q.at(0)});
			q = q.asInteger;
			if(q == 1, {~machine_learning_func.value;});
			("\nlast "++(~auto_select_diff)++" secs rated:\nx"++(~net_change_mult)++" points\n").postln;
		});
		rate_button_5.font = Font(size: ~firstviewboundsWIDTH/48);

		if(~net_change_mult == nil, {rate_button_5.valueAction = 0;}, {
			case
			{~net_change_mult == ~net_change_mult_array.at(0);}{rate_button_1.value = 1;}
			{~net_change_mult == ~net_change_mult_array.at(1);}{rate_button_2.value = 1;}
			{~net_change_mult == ~net_change_mult_array.at(2);}{rate_button_3.value = 1;}
			{~net_change_mult == ~net_change_mult_array.at(3);}{rate_button_4.value = 1;}
			{~net_change_mult == ~net_change_mult_array.at(4);}{rate_button_5.value = 1;};
		});


		ratepiecetext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/2.74571428571, ~firstviewboundsWIDTH/1.5, ~firstviewboundsHEIGHT/14.55));
		ratepiecetext.background=Color.white;
		ratepiecetext.string = "^rate last "++(~auto_select_diff)++" seconds from current position in piece by clicking on a xpt rating above, and clicking "++"Rate".quote++". A higher point number equals a higher rating.";
		ratepiecetext.font = Font(size: ~firstviewboundsWIDTH/55);

		rangeslider = EZRanger(~firstview, bounds: (Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/2.1951428571, ~firstviewboundsWIDTH/1.5, ~firstviewboundsHEIGHT/21.85)), controlSpec: ControlSpec(0, if(~piecedur_secs != nil, {~piecedur_secs}, {0}), \lin, 1, 50, "secs"), action: {
			|rangeselect|
			var rate_selection_start1;
			~rate_selection_start = (rangeselect.value.at(0)*(~instrument_1_full_pseq_array.size/~piecedur_secs));
			rate_selection_start1 = ~rate_selection_start.roundUp;
			if(rate_selection_start1 != ~rate_selection_start, {~rate_selection_start = rate_selection_start1-1});
			~rate_selection_end = (rangeselect.value.at(1)*(~instrument_1_full_pseq_array.size/~piecedur_secs)).roundUp;
			/*rangeselect.value.postln;*/

		}, initVal: [0,if(~piecedur_secs != nil, {~piecedur_secs}, {0})]);
		rangeslider.setColors(Color.grey,Color.white, Color.grey(0.7),Color.grey, Color.white, Color.yellow);
		rangeslider.font = Font(size: ~firstviewboundsWIDTH/55);

		/*rate_selectionstatictext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.502222222222 /*~firstviewboundsHEIGHT/6.2428571428571*/, ~firstviewboundsWIDTH/2.7, ~firstviewboundsHEIGHT/21.85));
		rate_selectionstatictext.background=Color.white;
		rate_selectionstatictext.string = if(~fullpiecedur != nil, {~fullpiecedur}, {"piece length - --:-- mins"});
		rate_selectionstatictext.font = Font(size: ~firstviewboundsWIDTH/48);*/

		if(~piece_position == nil, {~piece_position = 0});

		timeslider = EZSlider(~firstview,  bounds: (Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.95222222222, ~firstviewboundsWIDTH/1.5, ~firstviewboundsHEIGHT/21.85)), controlSpec: ControlSpec(0, if(~piecedur_secs != nil, {~piecedur_secs}, {0}), \lin, 1, 50, "secs"), action: {
			|timeselect|
			var selection1;
			~piece_position = timeselect.value*(~instrument_1_full_pseq_array.size/~piecedur_secs); // works
			selection1 = ~piece_position.roundUp;
			if(selection1 != ~piece_position, {~piece_position = selection1-1});
			if(timeslider.value >= ~auto_select_diff, {rangeslider.valueAction = [timeslider.value-~auto_select_diff, timeslider.value]}, {rangeslider.valueAction = [0, timeslider.value]});
			/*timeselect.value.postln;
			~piece_position.postln;*/

		});
		timeslider.setColors(Color.grey,Color.white);

		if(~pause_piece != nil, {if(~pause_piece != 1,timeslider.valueAction = 0; {rangeslider.valueAction = [0, if(~piecedur_secs != nil, {~piecedur_secs}, {0});]});});

		/*if(~pause_piece == 0, {~piece_position = 0});*/

		timeslidertext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.77222222222, ~firstviewboundsWIDTH/1.5, ~firstviewboundsHEIGHT/22.55));
		timeslidertext.background=Color.white;
		timeslidertext.string = "^jump to location in current piece by using the slider just above";
		timeslidertext.font = Font(size: ~firstviewboundsWIDTH/55);


		quicknewpiecebutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/4.228571428571, ~firstviewboundsWIDTH/6.1454545454545, ~firstviewboundsHEIGHT/21.85)).states_([["quick new piece",Color.white,Color.black],["quick new piece",Color.white,Color.black]]).action_({arg button;
			var quicknewpiecewait;
			quicknewpiecewait = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/9.5, ~firstviewboundsWIDTH/1.5, ~firstviewboundsHEIGHT/22.55));
			quicknewpiecewait.background_(Color.white);
			quicknewpiecewait.stringColor_(Color.black);
			quicknewpiecewait.string = "please wait";
			quicknewpiecewait.font = Font(size: ~firstviewboundsWIDTH/55);
			"please wait".postln;
			~quicknewpiecebutton = 1;
			{if(~duranduranbot_routine.isPlaying == true, {~stop_func.value});}.value;
			AppClock.sched(0, {
				if(~seedscheck == 1, {newrandomseedsbutton.valueAction = 0}, {~seedscheck = 1});
				generatepiecebutton.valueAction = 0; //piece fires at end of piece gen func
			});
			quicknewpiecewait.close;
		});
		quicknewpiecebutton.font = Font(size: ~firstviewboundsWIDTH/48);

		quicknewpiecebutton_revert = Button.new(~firstview, Rect(~firstviewboundsWIDTH/5.4, ~firstviewboundsHEIGHT/4.228571428571, ~firstviewboundsWIDTH/7.9454545454545, ~firstviewboundsHEIGHT/21.85)).states_([["revert piece",Color.white,Color.black],["revert piece",Color.white,Color.black]]).action_({arg button;
			var quicknewpiecewait;
			quicknewpiecewait = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/2.0228571, ~firstviewboundsWIDTH/1.5, ~firstviewboundsHEIGHT/22.55));
			quicknewpiecewait.background_(Color.white);
			quicknewpiecewait.stringColor_(Color.black);
			quicknewpiecewait.string = "please wait";
			quicknewpiecewait.font = Font(size: ~firstviewboundsWIDTH/55);
			"please wait".postln;
			~quicknewpiecebutton = 1;

			if(~duranduranbot_routine.isPlaying == true, {~stop_func.value;});

			AppClock.sched(0, {
				if(~seedscheck == 1, {reversenewrandomseedsbutton.valueAction = 0}, {~seedscheck = 1});
				generatepiecebutton.valueAction = 0; //piece fires at end of piece gen func
			});
			quicknewpiecewait.close;
		});
		quicknewpiecebutton_revert.font = Font(size: ~firstviewboundsWIDTH/48);

		recordbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.2822222222222, ~firstviewboundsWIDTH/9, ~firstviewboundsHEIGHT/21.85)).states_([["record off",Color.white,Color.black],["record on",Color.black,Color.red]]).action_({arg button;
			if(button.value == 1, {
				~recordtext.string = "^all pieces WILL be recorded";
				~will_record = 1;
			}, {~recordtext.string = "^all pieces will NOT be recorded"; ~will_record = 0;});

		});
		recordbutton.font = Font(size: ~firstviewboundsWIDTH/48);

		~recordtext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.2, ~firstviewboundsWIDTH/2.2, ~firstviewboundsHEIGHT/21.85));
		~recordtext.background=Color.white;
		~recordtext.string = "^all pieces will NOT be recorded";
		~recordtext.font = Font(size: ~firstviewboundsWIDTH/55);

		if(~will_record == 1, {~recordtext.string = "^all pieces WILL be recorded"; recordbutton.value = 1;},
			{~recordtext.string = "^all pieces will NOT be recorded"; recordbutton.value = 0;});

		piecedurationstatictext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.502222222222 /*~firstviewboundsHEIGHT/6.2428571428571*/, ~firstviewboundsWIDTH/2.7, ~firstviewboundsHEIGHT/21.85));
		piecedurationstatictext.background=Color.white;
		piecedurationstatictext.string = if(~fullpiecedur != nil, {~fullpiecedur}, {"piece length - --:-- mins"});
		piecedurationstatictext.font = Font(size: ~firstviewboundsWIDTH/48);

		/*ctrlperiodtext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/1.4173228346457, ~firstviewboundsHEIGHT/13.5, ~firstviewboundsWIDTH/3.5, ~firstviewboundsHEIGHT/4.37));
		ctrlperiodtext.background=maincolor;
		ctrlperiodtext.string = "*Important Note*... You can kill all processes by hitting "++"cmd/ctrl - period".quote++"on your keyboard.";
		ctrlperiodtext.align = \topLeft;
		ctrlperiodtext.font = Font(size: ~firstviewboundsWIDTH/70.454545454545);*/

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
			"randseed 3 - "++~randseed_3.asString++(if(~quicknewpiecebutton != 1, {
				"\n(also posted in post window)"++"\n"++
				"*make sure to hit "++"generate piece".quote++" to generate a new piece based on the new seeds"}, {""}));
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
			"randseed 3 - "++~randseed_3.asString++(if(~quicknewpiecebutton != 1, {
				"\n(also posted in post window)"++"\n"++
				"*make sure to hit "++"generate piece".quote++" to generate a new piece based on the new seeds"}, {""}));
			z.postln;
			currentrandomseedstrext.string = z;


		});
		reversenewrandomseedsbutton.font = Font(size: ~firstviewboundsWIDTH/48);

		currentrandomseedstrext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/1.4173228346457, ~firstviewboundsHEIGHT/4.6, ~firstviewboundsWIDTH/4, ~firstviewboundsHEIGHT/3.6416666666667));
		currentrandomseedstrext.background=maincolor;
		currentrandomseedstrext.string ="Current random seeds:\n"++
		"randseed 1 - "++~randseed_1++"\n"++
		"randseed 2 - "++~randseed_2++"\n"++
		"randseed 3 - "++~randseed_3.asString++(if(~quicknewpiecebutton != 1, {
			"\n(also posted in post window)"++"\n"++
			"*make sure to hit "++"generate piece".quote++" to generate a new piece based on the new seeds"}, {""}));
		currentrandomseedstrext.align = \topLeft;
		currentrandomseedstrext.font = Font(size: ~firstviewboundsWIDTH/58.384615384615);

		see_saved_seeds_file_button = Button.new(~firstview, Rect(~firstviewboundsWIDTH/1.4173228346457, ~firstviewboundsHEIGHT/1.9422222222222, ~firstviewboundsWIDTH/4, ~firstviewboundsHEIGHT/21.85)).states_([["see saved random seeds",Color.white,Color.black],["see saved random seeds",Color.white,Color.black]]).action_({arg button;

			h = Document.open(Document.current.dir++"/duranduranbot_saved_random_seeds.scd");


		});
		see_saved_seeds_file_button.font = Font(size: ~firstviewboundsWIDTH/48);


		machinelearningbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.12, ~firstviewboundsWIDTH/4.2, ~firstviewboundsHEIGHT/21.85)).states_([["machine learning is ON",Color.white,Color.black],["machine learning is OFF",Color.white,Color.black]]).action_({arg button;
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

		machinelearningtext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/1.06, ~firstviewboundsWIDTH/2, ~firstviewboundsHEIGHT/21.85));
		machinelearningtext.background=Color.white;
		machinelearningtext.string = "^more info about machine learning on "++"instructions".quote++" page";
		machinelearningtext.font = Font(size: ~firstviewboundsWIDTH/55);

		q = FileReader.read(Document.current.dir++"/other_program_files/ddbot_machine_learning_on_off.scd");
		2.do({q = q.at(0)});
		q = q.asInteger;
		if(q == 1, {machinelearningbutton.value = 0;});


		closeddbotbutton = Button.new(~firstview, Rect(~firstviewboundsWIDTH/1.2, ~firstviewboundsHEIGHT/1.1, ~firstviewboundsWIDTH/7.5, ~firstviewboundsHEIGHT/21.85)).states_([["close DD'bot",Color.white,Color.black],["close DD'bot",Color.white,Color.black]]).action_({arg button;
			~stop_func.value;
			Server.freeAll;
			w.close;
		});
		closeddbotbutton.font = Font(size: ~firstviewboundsWIDTH/48);

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

		firstviewtext4 = StaticText(~firstview, Rect(~firstviewboundsWIDTH/72, ~firstviewboundsHEIGHT/7.528571428571, ~firstviewboundsWIDTH/1.0285714285714, ~firstviewboundsHEIGHT/0.54625));
		firstviewtext4.background=maincolor;
		firstviewtext4.string = "HOW TO PLAY A PIECE\n\nPlay a DuranDuranbot piece by clicking the "++"generate piece".quote++"  button on the Main Page, and then by clicking the "++"play piece".quote++"  button. Once random seeds are input into the program on the front page (the very first page of this program), you only need to generate a song once using the same random seeds. If you click on the "++"generate piece".quote++"  button more than once without inputting new random seeds the same piece will always be generated. To generate a new piece, you can go back to the first page and input new random seeds, or you can do this automatically by clicking on the "++"new random seeds".quote++" button across from the "++"generate piece".quote++" button on the right side of the main page. Or, you can quickly generate a new piece based on entirely new random seeds by simply clicking on the "++"quick new piece".quote++" button a few sets of buttons below the "++"generate piece".quote++" button. \n\nMACHINE LEARNING\n\nMachine learning is enabled by default, but you can disable it on the main page. Using the machine learning function allows for DuranDuranbot to learn what you prefer to hear in a piece by rating a piece, and to become better at composing music for you. On the Main Page, you can rate a piece by clicking on any of the point ratings and clicking "++"Rate".quote++". The rating system is currently set to rate the last "++(~auto_select_diff)++" seconds from your current position in the piece designated by where the time slider is positioned... Doing all of this will train DuranDuranbot how to compose music. All training data will be saved to the DuranDuranbot "++"ddbot_training_data".quote++" folder for future use.";
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

		if(~pause_piece == 0, {~playbutton.valueAction = 0});

		~interval_array = (1..12);
		/*~dna_choice_array = (1..64);*/
		~time_array = [0.0625, 0.125, 0.25, 0.5, 1, 2, 4, 8];
		~dna_choice_array = [1, 2, 4, 8, 16, 32, 64, 128];
		/*~dna_choice_array = [~bit_duration*1, ~bit_duration*2, ~bit_duration*4, ~bit_duration*8, ~bit_duration*16, ~bit_duration*32, ~bit_duration*64];*/
		/*~time_array = [0.25, 1, 2, 4];*/
		~dna_choice_array_num = (1..~dna_choice_array.size);
		~net_change = 0.01;

		/*("instrument_"++(1)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(x)).postln

		("instrument_"++(1)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(x-1)).postln;
		("instrument_"++(2)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(x-1)).postln;
		("instrument_"++(3)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(x-1)).postln;*/

		/*("instrument_"++(1)++"_full_pseq_array_midi").asSymbol.envirPut(
			[56,56,56,56,56,56,56,56,56,56,76,76,76,76,76,76,0,0,0,0,0,0,0,0,66,66,66,66,66,66,66,66,66,66,66,66,66,66,66]
		);
		("instrument_"++(2)++"_full_pseq_array_midi").asSymbol.envirPut(
			[45,45,45,45,45,45,45,0,0,0,0,0,0,0,0,0,0,68,68,68,68,68,68,68,68,68,55,55,55,55,75,75,75,75,75,75,75,75]
		);
		("instrument_"++(3)++"_full_pseq_array_midi").asSymbol.envirPut(
			[87,87,87,87,87,87,87,87,87,96,96,96,96,96,96,0,0,0,0,0,0,79,79,79,79,75,75,75,75,75,75,75,71,71,71,71,71,71]
		);
		~number_of_instruments = 3;
		~rate_selection_start = 0;
		~rate_selection_end = ("instrument_"++(1)++"_full_pseq_array_midi").asSymbol.envirGet - 1;
		~inst_array = [1,2,3];*/




		// create back up func. write to 2 different folders.


		(
			("intervals written -").post;
			("\n").post;

			~number_of_instruments.do(r = 0; {
				r=r+1;
				~inst_num = r;
				(~rate_selection_end-~rate_selection_start).do(x = 0; {
					x=x+1;
					j = ("instrument_"++(~inst_num)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(x-1));
					v = ("instrument_"++(~inst_num)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+x);
					if(((v != j) and: (v != 0) and: (j != 0) and: (j != nil)), {
						u = 0;
						("diff"++(u=u+1)).asSymbol.envirPut(
							e = v - j;
							if(e.isNegative == true, {e = e.neg});
							while({e > 12}, {e = e - 12});
							e.value;
						);
						(~number_of_instruments-1).do(t = 1; {
							("diff"++(u=u+1)).asSymbol.envirPut(
								e = j - ("instrument_"++(~inst_array.wrapAt(~inst_num-(t=t-1)))++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(x-1));
								if(e.isNegative == true, {e = e.neg});
								while({e > 12}, {e = e - 12});
								e.value;
							);
						});

						~number_of_instruments.do(u = 0; {
							u=u+1;
							("diff"++(u)).asSymbol.envirPut(("diff"++(u)).asSymbol.envirGet.round.asInteger;);
						});

						/*~diff1
						~diff2
						~diff3*/

						("inst"++(r)++" "++(~diff1)++" ").post;

						/*("/other_program_files/ddbot_training_data/ddbot_interval_weights/"++(~player_array.wrapAt(r-1))++"__"++(~diff2)++"_"++(~diff3)++"_weights.scd").asString.postln;
						*/
						h = FileReader.read(Document.current.dir++"/other_program_files/ddbot_training_data/ddbot_interval_weights/"++(~player_array.wrapAt(r-1))++"__"++(~diff2)++"_"++(~diff3)++"_weights.scd", false, true);
						h = h.flatten.asFloat;
						h.put(~diff1-1, (h.at(~diff1-1) + (~net_change*~net_change_mult)));
						h = h.normalizeSum;
						g = File(Document.current.dir++"/other_program_files/ddbot_training_data/ddbot_interval_weights/"++(~player_array.wrapAt(r-1))++"__"++(~diff2)++"_"++(~diff3)++"_weights.scd", "w");
						~interval_array.size.do(s = (-1); {g.write(h.at(s=s+1).asString++" ");});
						g.close;
					});
				});
			});
		);

		/*~number_of_instruments.do(w = 0; v = 0; {
		w=w+1;
		(~interval_array.size+1).do(y = (-1); {
		y=y+1;
		(~interval_array.size+1).do(z = (-1); {
		("player_"++(w)++"__"++(y)++"_"++(z=z+1)++"_weights").asSymbol.envirPut(Array.fill(~interval_array.size, {1/~interval_array.size}).normalizeSum;);
		g = File(Document.current.dir++"/other_program_files/ddbot_training_data/ddbot_interval_weights/player_"++(w)++"__"++(y)++"_"++(z)++"_weights.scd", "w");
		~interval_array.size.do(s = (-1); {g.write(("player_"++(w)++"__"++(y)++"_"++(z)++"_weights").asSymbol.envirGet.at(s=s+1).asString++" ");});
		g.close;
		v=v+1; v.postln;
		});
		});
		});*/


		// (~net_change*12)
		// y=0.083333333333333
		// [ y=y+(0.01*12), 0.083333333333333, 0.083333333333333, 0.083333333333333,
		// 	0.083333333333333, 0.083333333333333, 0.083333333333333, 0.083333333333333,
		// 0.083333333333333, 0.083333333333333, 0.083333333333333, 0.083333333333333 ].normalizeSum

		/*
		x=Array.fill(~interval_array.size, {1/~interval_array.size}).normalizeSum;*/


	/*	~number_of_instruments.do(w = 0; v = 0; {
			w=w+1;
			(~interval_array.size+1).do(y = (-1); {
				y=y+1;
				(~interval_array.size+1).do(z = (-1); {
					z=z+1;
					(~time_array.size+1).do(a = (-1); {
						a=a+1;
						(~time_array.size+1).do(b = (-1); {
							b=b+1;
							(~time_array.size+1).do(c = (-1); {
								("player_"++(w)++"__"++(y)++"_"++(z)++"__"++(a)++"_"++(b)++"_"++(c=c+1)).asSymbol.envirPut(Array.fill(~interval_array.size, {1/~interval_array.size}).normalizeSum;);
								g = File(Document.current.dir++"/other_program_files/ddbot_weights/player_"++(w)++"__"++(y)++"_"++(z)++"__"++(a)++"_"++(b)++"_"++(c)++".scd", "w");
								~interval_array.size.do(s = (-1); {g.write(("player_"++(w)++"__"++(y)++"_"++(z)++"__"++(a)++"_"++(b)++"_"++(c)).asSymbol.envirGet.at(s=s+1).asString++" ");});
								g.close;
								v=v+1; v.postln;
							});
						});
					});
				});
			});
		});*/



		/*	((("inst_"++(w)).asSymbol.envirGet)++"_"++(0)++(0)++(0)++"_weights").asSymbol.envirGet



		("instrument_"++(1)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(x)).postln

		("instrument_"++(1)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(x-1)).postln;
		("instrument_"++(2)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(x-1)).postln;
		("instrument_"++(3)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(x-1)).postln;*/


		// do it where it counts number of bits per note... for each inst... then scan last note of same inst, as well as the notes
		// of other inst at time of start of new note for current inst

		/*("instrument_"++(~inst_num)++"_full_pseq_array_midi").asSymbol.envirGet.at(y=y-1);

		("instrument_"++(~inst_array.wrapAt(~inst_num-(t)))++"_full_pseq_array_midi").asSymbol.envirGet.at(y=y+1);*/

		(
			("\n").post;
			("bit durations written -").post;
			("\n").post;

			1.do(r = 0; {
				r=r+1;
				~inst_num = r;
				(~rate_selection_end-~rate_selection_start).do(x = 0; {
					x=x+1;
					j = ("instrument_"++(~inst_num)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(x-1));
					v = ("instrument_"++(~inst_num)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+x);
					if(v != j, {k = 0; c = (~rate_selection_start+(x)); u = 0;
						while({
							("instrument_"++(~inst_num)++"_full_pseq_array_midi").asSymbol.envirGet.at(c=c-1) ==
							("instrument_"++(~inst_num)++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(x-1))
						}, {k = k +1});
						~length2 = k;
						k = 0; c = (~rate_selection_start+(x));
						while({
							("instrument_"++(~inst_num)++"_full_pseq_array_midi").asSymbol.envirGet.at(c=c+1) ==
							("instrument_"++(~inst_num)++"_full_pseq_array_midi").asSymbol.envirGet.at(c-1)
						}, {k = k +1});
						~length1 = k+1;
						(~number_of_instruments-1).do(t = 0; u = 2; {
							q = x-1;
							d = ("instrument_"++(~inst_array.wrapAt(~inst_num-(t)))++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(q-1));
							f = ("instrument_"++(~inst_array.wrapAt(~inst_num-(t)))++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+q);
							while({f == d}, {
								q=q-1;
								d = ("instrument_"++(~inst_array.wrapAt(~inst_num-(t)))++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+(q-1));
								f = ("instrument_"++(~inst_array.wrapAt(~inst_num-(t)))++"_full_pseq_array_midi").asSymbol.envirGet.at(~rate_selection_start+q);
							});
							c = (~rate_selection_start+(q+1));
							k = 0;
							while({
								("instrument_"++(~inst_array.wrapAt(~inst_num-(t)))++"_full_pseq_array_midi").asSymbol.envirGet.at(c=c+1) ==
								("instrument_"++(~inst_array.wrapAt(~inst_num-(t)))++"_full_pseq_array_midi").asSymbol.envirGet.at(c-1)
							}, {k = k +1});
							k=k+2;
							("length"++(u=u+1)).asSymbol.envirPut(k);
							t=t-1;
						});


						/*~length1.postln;*/
						/*~length1
						~length2
						~length3
						~length4
*/
						/*~diff1
						~diff2
						~diff3*/

						(~number_of_instruments+1).do(u = 0; {
							u=u+1;
							("length"++(u)).asSymbol.envirPut(("length"++(u)).asSymbol.envirGet.round.asInteger;);
						});

						(~number_of_instruments+1).do(u = 0; {
							u=u+1;
							case
							{(("length"++(u)).asSymbol.envirGet*~bit_duration >= ~time_array.at(0)) and: (("length"++(u)).asSymbol.envirGet*~bit_duration <= ~time_array.at(1))}{if((("length"++(u)).asSymbol.envirGet*~bit_duration < (~time_array.at(0)+~time_array.at(1)/2)), {("lengthplace"++(u)).asSymbol.envirPut(0)}, {("lengthplace"++(u)).asSymbol.envirPut(1)})}
							{(("length"++(u)).asSymbol.envirGet*~bit_duration >= ~time_array.at(1)) and: (("length"++(u)).asSymbol.envirGet*~bit_duration <= ~time_array.at(2))}{if((("length"++(u)).asSymbol.envirGet*~bit_duration < (~time_array.at(1)+~time_array.at(2)/2)), {("lengthplace"++(u)).asSymbol.envirPut(1)}, {("lengthplace"++(u)).asSymbol.envirPut(2)})}
							{(("length"++(u)).asSymbol.envirGet*~bit_duration >= ~time_array.at(2)) and: (("length"++(u)).asSymbol.envirGet*~bit_duration <= ~time_array.at(3))}{if((("length"++(u)).asSymbol.envirGet*~bit_duration < (~time_array.at(2)+~time_array.at(3)/2)), {("lengthplace"++(u)).asSymbol.envirPut(2)}, {("lengthplace"++(u)).asSymbol.envirPut(3)})}
							{(("length"++(u)).asSymbol.envirGet*~bit_duration >= ~time_array.at(3)) and: (("length"++(u)).asSymbol.envirGet*~bit_duration <= ~time_array.at(4))}{if((("length"++(u)).asSymbol.envirGet*~bit_duration < (~time_array.at(3)+~time_array.at(4)/2)), {("lengthplace"++(u)).asSymbol.envirPut(3)}, {("lengthplace"++(u)).asSymbol.envirPut(4)})}
							{(("length"++(u)).asSymbol.envirGet*~bit_duration >= ~time_array.at(4)) and: (("length"++(u)).asSymbol.envirGet*~bit_duration <= ~time_array.at(5))}{if((("length"++(u)).asSymbol.envirGet*~bit_duration < (~time_array.at(4)+~time_array.at(5)/2)), {("lengthplace"++(u)).asSymbol.envirPut(4)}, {("lengthplace"++(u)).asSymbol.envirPut(5)})}
							{(("length"++(u)).asSymbol.envirGet*~bit_duration >= ~time_array.at(5)) and: (("length"++(u)).asSymbol.envirGet*~bit_duration <= ~time_array.at(6))}{if((("length"++(u)).asSymbol.envirGet*~bit_duration < (~time_array.at(5)+~time_array.at(6)/2)), {("lengthplace"++(u)).asSymbol.envirPut(5)}, {("lengthplace"++(u)).asSymbol.envirPut(6)})}
							{(("length"++(u)).asSymbol.envirGet*~bit_duration >= ~time_array.at(6)) and: (("length"++(u)).asSymbol.envirGet*~bit_duration <= ~time_array.at(7))}{if((("length"++(u)).asSymbol.envirGet*~bit_duration < (~time_array.at(6)+~time_array.at(7)/2)), {("lengthplace"++(u)).asSymbol.envirPut(6)}, {("lengthplace"++(u)).asSymbol.envirPut(7)})}
							{(("length"++(u)).asSymbol.envirGet*~bit_duration >= ~time_array.at(7))}{("lengthplace"++(u)).asSymbol.envirPut(7)};

						});

						(~number_of_instruments+1).do(u = 0; {
							u=u+1;
							("lengthplace"++(u)).asSymbol.envirPut(("lengthplace"++(u)).asSymbol.envirGet.round.asInteger;);
						});

						/*~diff3*~bit_duration

						~length1
						~length2
						~length3
						~length4
						~lengthplace2
						~lengthplace3
						~lengthplace4*/
						/*"write".postln;*/

						// don't think ~lengthplace matters with players. doesn't work like that in inst_clock_func.

						(""++(~length1)++" ").post;
						/*("/other_program_files/ddbot_training_data/ddbot_time_weights/"++(~player_array.wrapAt(r-1))++"__"++(~lengthplace2)++"_"++(~lengthplace3)++"_"++(~lengthplace4)++"_time_weights.scd").asString.postln;
						*/
						h = FileReader.read(Document.current.dir++"/other_program_files/ddbot_training_data/ddbot_time_weights/"++(~player_array.wrapAt(r-1))++"__"++(~lengthplace2)++"_"++(~lengthplace3)++"_"++(~lengthplace4)++"_time_weights.scd", false, true);
						h = h.flatten.asFloat;
						h.put(~lengthplace1, (h.at(~lengthplace1) + (~net_change*~net_change_mult)));
						h = h.normalizeSum;
						g = File(Document.current.dir++"/other_program_files/ddbot_training_data/ddbot_time_weights/"++(~player_array.wrapAt(r-1))++"__"++(~lengthplace2)++"_"++(~lengthplace3)++"_"++(~lengthplace4)++"_time_weights.scd", "w");
						~dna_choice_array.size.do(s = (-1); {g.write(h.at(s=s+1).asString++" ");});
						g.close;
					});
				});
			});
		);



		/*~number_of_instruments.do(w = 0; v = 0; {
		w=w+1;
		(~time_array.size+1).do(x = (-1); {
		x=x+1;
		(~time_array.size+1).do(y = (-1); {
		y=y+1;
		(~time_array.size+1).do(z = (-1); {
		("player_"++(w)++"__"++(x)++"_"++(y)++"_"++(z=z+1)++"_time_weights").asSymbol.envirPut(Array.fill(~dna_choice_array.size, {1/~dna_choice_array.size}).normalizeSum;);
		g = File(Document.current.dir++"/other_program_files/ddbot_training_data/ddbot_time_weights/player_"++(w)++"__"++(x)++"_"++(y)++"_"++(z)++"_time_weights.scd", "w");
		~dna_choice_array.size.do(s = (-1); {g.write(("player_"++(w)++"__"++(x)++"_"++(y)++"_"++(z)++"_time_weights").asSymbol.envirGet.at(s=s+1).asString++" ");});
		g.close;
		v=v+1; v.postln;
		});
		});
		});
		});*/

		/*("player_"++(w)++"__"++(0)++"_"++(0)++"_"++(0)++"_time_weights").asSymbol.envirGet*/



		if(~pause_piece == 1, {~playbutton.valueAction = 1});

		ratedonetext = StaticText(~firstview, Rect(~firstviewboundsWIDTH/3.063829787234, ~firstviewboundsHEIGHT/4.228571428571, ~firstviewboundsWIDTH/4.04545454545, ~firstviewboundsHEIGHT/21.85));
		ratedonetext.background=Color.white;
		ratedonetext.stringColor_(Color.black);
		ratedonetext.string = "PIECE SELECTION RATED";
		ratedonetext.font = Font(size: ~firstviewboundsWIDTH/55);

		AppClock.sched(3, {ratedonetext.close;});

	};

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// BUILD/GENERATE/COMPOSE PIECE

	~piece_generator_func = {

		// THERE IS A POINT TO USING BIT-BY-BIT CIRCULAR COMPOSITION ( https://scsynth.org/t/bit-by-bit-circular-composition/1107 )
		// Not using it, DDbot player can't compose based on everyone else, for the player isn't composing is parallel.
		// Players NEED to be composing in parallel with everyone else... On the "same track".

		(
			(

				"gen checkpoint 1".postln;

				~tuning_frequency = 440; //default 440 hz
				~freqmap = (i = ~tuning_frequency / (2 ** (69 / 12)); a = (-1); b = (-1); Array.fill(128, {i * (2 ** (((a=a+1) / 12).trunc)) * ( (2 ** (12.reciprocal)) ** ((b=b+1)  % 12));}));/*~freqmap = (i = 8.0271480262684/*-0.0000000000024*/; ~stepratio = 1.0594630943593; Array.fill(128, { i = i*~stepratio;}));*/
				~freqmap = ~freqmap.cpsmidi;
				/*~freqmap2 = (i = ~freqmap.at(58)/*-0.0000000000024*/; ~stepratio = 1.0594630943593; Array.fill(24, { i = i*~stepratio;}));*/
				~freqmap2 = (n = 54; Array.fill(36, {~freqmap.at(n=n+1);}));
				/*~ratio_array = (x = 0; Array.fill(12, {1.0594630943593**(x=x+1)}));*/
				~interval_array = (1..12);
				~midi_ratio_array = (1..12);

				thisThread.randSeed = ~randseed_1;

				~player_array = (x = 0; Array.fill(~number_of_instruments, {"player_"++(x=x+1)}));
				~player_array = ~player_array.scramble;
				~number_of_instruments.do(x = 0; {("inst_"++(x=x+1)).asSymbol.envirPut(~player_array.at(x-1));});

				/*~dna_choice_array = (1..64);*/
				~time_array = [0.0625, 0.125, 0.25, 0.5, 1, 2, 4, 8];
				~dna_choice_array = [1, 2, 4, 8, 16, 32, 64, 128];
				~dna_choice_array_num = (1..~dna_choice_array.size);

				x = 0;
				~inst_array = Array.fill(~number_of_instruments, {x=x+1});

				~inst_clock_func = {

					("instrument_"++(~inst_num)++"_array_part_"++(~part_num)).asSymbol.envirPut(
						("instrument_"++(~inst_num)++"_array_part_"++(~part_num)).asSymbol.envirGet.add(
/*if(~inst_num == 3, {("dna_clock_"++(3)++"_choice").asSymbol.envirGet.postln});*/
							if(~dna_clock == ("dna_clock_"++(~inst_num)++"_choice").asSymbol.envirGet, {

								("dna_clock_"++(~inst_num)).asSymbol.envirPut(0);

/*if(~inst_num == 3, {("instrument_"++(3)++"_freq").asSymbol.envirGet.postln;});*/

							/*	if(~inst_num == 3, {("dna_clock_"++(3)++"_choice").asSymbol.envirGet});*/
									("instrument_"++(~inst_num)++"_if_zero").asSymbol.envirPut("false");

									//find new interval for current instrument

									~clock_diff_1 = ("instrument_"++(~inst_array.wrapAt(~inst_num-1))++"_freq").asSymbol.envirGet - ("instrument_"++(~inst_array.wrapAt(~inst_num))++"_freq").asSymbol.envirGet;
									if(~clock_diff_1.isFloat == true, {~clock_diff_1 = ~clock_diff_1.round});
									if(~clock_diff_1.isNegative == true, {~clock_diff_1 = ~clock_diff_1.neg});
									while({~clock_diff_1 > 12}, {~clock_diff_1 = ~clock_diff_1 - 12});
									~clock_diff_2 = ("instrument_"++(~inst_array.wrapAt(~inst_num-1))++"_freq").asSymbol.envirGet - ("instrument_"++(~inst_array.wrapAt(~inst_num+1))++"_freq").asSymbol.envirGet;
									if(~clock_diff_2.isFloat == true, {~clock_diff_2 = ~clock_diff_2.round});
									if(~clock_diff_2.isNegative == true, {~clock_diff_2 = ~clock_diff_2.neg});
									while({~clock_diff_2 > 12}, {~clock_diff_2 = ~clock_diff_2 - 12});

									(~number_of_instruments-1).do(u = 0; {
										u=u+1;
										("clock_diff_"++(u)).asSymbol.envirPut(("clock_diff_"++(u)).asSymbol.envirGet.round.asInteger;);
									});

									~intv_weights = FileReader.read(Document.current.dir++"/other_program_files/ddbot_training_data/ddbot_interval_weights/"++(~player_array.wrapAt(~inst_num-1))++"__"++(~clock_diff_1)++"_"++(~clock_diff_2)++"_weights.scd", false, true);
									~intv_weights = ~intv_weights.flatten.asFloat;
									~intv_weights = ~intv_weights.normalizeSum;
									~new_interval = ~interval_array.wchoose(~intv_weights);
									~new_interval = [~new_interval, ~new_interval.neg].choose;

									("instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet + ~new_interval);

									if(((("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet > 90) or: (("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet < 55)), {
										while({("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet > 90}, {("instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet-12)});
										while({("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet < 55}, {("instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet+12)});
									});

									//find new bit duration for current instrument

									(~number_of_instruments).do(e = 0; {
										e=e+1;
										case
									{(("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration >= ~time_array.at(0)) and: (("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration <= ~time_array.at(1))}{if((("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration < (~time_array.at(0)+~time_array.at(1)/2)), {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(0)}, {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(1)})}
									{(("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration >= ~time_array.at(1)) and: (("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration <= ~time_array.at(2))}{if((("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration < (~time_array.at(1)+~time_array.at(2)/2)), {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(1)}, {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(2)})}
									{(("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration >= ~time_array.at(2)) and: (("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration <= ~time_array.at(3))}{if((("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration < (~time_array.at(2)+~time_array.at(3)/2)), {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(2)}, {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(3)})}
									{(("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration >= ~time_array.at(3)) and: (("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration <= ~time_array.at(4))}{if((("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration < (~time_array.at(3)+~time_array.at(4)/2)), {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(3)}, {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(4)})}
									{(("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration >= ~time_array.at(4)) and: (("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration <= ~time_array.at(5))}{if((("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration < (~time_array.at(4)+~time_array.at(5)/2)), {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(4)}, {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(5)})}
									{(("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration >= ~time_array.at(5)) and: (("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration <= ~time_array.at(6))}{if((("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration < (~time_array.at(5)+~time_array.at(6)/2)), {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(5)}, {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(6)})}
									{(("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration >= ~time_array.at(6)) and: (("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration <= ~time_array.at(7))}{if((("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration < (~time_array.at(6)+~time_array.at(7)/2)), {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(6)}, {("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(7)})}
									{(("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_choice").asSymbol.envirGet*~bit_duration >= ~time_array.at(7))}{("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+e))++"_place").asSymbol.envirPut(7)};
									});


									/*
									("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+2))++"_choice").asSymbol.envirGet
									("dna_clock_"++(~inst_array.wrapAt(~inst_num-1+2))++"_place").asSymbol.envirGet
									*/

									~time_weights = FileReader.read(Document.current.dir++"/other_program_files/ddbot_training_data/ddbot_time_weights/"++(~player_array.wrapAt(~inst_num-1))++"__"++(("dna_clock_"++(~inst_array.wrapAt(~inst_num-1))++"_place").asSymbol.envirGet)++"_"++(("dna_clock_"++(~inst_array.wrapAt(~inst_num))++"_place").asSymbol.envirGet)++"_"++(("dna_clock_"++(~inst_array.wrapAt(~inst_num+1))++"_place").asSymbol.envirGet)++"_time_weights.scd", false, true);
									~time_weights = ~time_weights.flatten.asFloat;
									~time_weights = ~time_weights.normalizeSum;
									~new_time = ~dna_choice_array.wchoose(~time_weights);

									("dna_clock_"++(~inst_num)++"_choice").asSymbol.envirPut(~new_time);

									~put1 = ("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet;

								/*if(~inst_num == 3, {("instrument_"++(3)++"_freq").asSymbol.envirGet.postln;});*/

							},
							{
								~put1 = if(("instrument_"++(~inst_num)++"_if_zero").asSymbol.envirGet == "false", {("instrument_"++(~inst_num)++"_freq").asSymbol.envirGet;}, {0});

							});

							~put1.value;
						);
					);
				};



				~number_of_instruments.do(x = 0; {
					x=x+1;
					~number_of_parts_in_piece.do(y = 0; {("instrument_"++(x)++"_array_part_"++(y=y+1)).asSymbol.envirPut([]);});
				});

			);

			"gen checkpoint 2".postln;

			//Piece creation in parts. Only reason to have parts is to determine length of piece.

			(

				~create_piece_function = {

					thisThread.randSeed = ~randseed_2;

					~part_bit_size = 64;
					~max_number_of_parts = 200; //max 100 parts. random probability choice decreases linearly from "~max_number_of_parts" value to 1.
					~number_of_parts_in_piece = (~max_number_of_parts.linrand - ~max_number_of_parts).neg;

					~create_piece_routine = Routine({

						thisThread.randSeed = ~randseed_3;

						~number_of_instruments.do(x = 0; {
							x=x+1;
							~number_of_parts_in_piece.do(y = 0; {("instrument_"++(x)++"_array_part_"++(y=y+1)).asSymbol.envirPut([]);});
						});

						~number_of_instruments.do(y = 0; {("dna_clock_"++(y=y+1)).asSymbol.envirPut(0);});


						//generation of piece

						1.do({~part_num = 1;

							1.do({

								1.do(x = 0; {("instrument_"++(x=x+1)++"_if_zero").asSymbol.envirPut("false");});

								("instrument_1_array_part_"++(~part_num)).asSymbol.envirPut(
									("instrument_1_array_part_"++(~part_num)).asSymbol.envirGet.add(~instrument_1_freq = ~freqmap2.choose)
								);
								("instrument_2_array_part_"++(~part_num)).asSymbol.envirPut(
									("instrument_2_array_part_"++(~part_num)).asSymbol.envirGet.add(~instrument_2_freq = ~freqmap2.choose)
								);
								("instrument_3_array_part_"++(~part_num)).asSymbol.envirPut(
									("instrument_3_array_part_"++(~part_num)).asSymbol.envirGet.add(~instrument_3_freq = ~freqmap2.choose)
								);

								("dna_clock_"++(1)++"_choice").asSymbol.envirPut(~dna_choice_array.choose);
								("dna_clock_"++(2)++"_choice").asSymbol.envirPut(~dna_choice_array.choose);
								("dna_clock_"++(3)++"_choice").asSymbol.envirPut(~dna_choice_array.choose);
								/*
								("dna_clock_"++(3)++"_choice").asSymbol.envirGet*/

								/*(~number_of_instruments-1).do(x = 1; {
								("instrument_"++(x=x+1)++"_freq").asSymbol.envirPut(0);
								("dna_clock_"++(x)++"_choice").asSymbol.envirPut(0);/*
								("dna_clock_"++(2)++"_choice").asSymbol.envirGet <~time_array.at(0)           (0);*/
								});*/

								/*(~number_of_instruments-1).do(s = 0; {("dna_clock_"++(s=s+1)).asSymbol.envirPut(("dna_clock_"++(s)).asSymbol.envirGet+1);});
								(~number_of_instruments-1).do(s = 1; {
								s=s+1;
								~dna_clock = ("dna_clock_"++(s)).asSymbol.envirGet;
								~inst_num = s;
								~inst_clock_func.value;
								});*/
							});

							(~part_bit_size-1).do({

								~number_of_instruments.do(n = 0; {("dna_clock_"++(n=n+1)).asSymbol.envirPut(("dna_clock_"++(n)).asSymbol.envirGet+1);});
								~number_of_instruments.do(n = 0; {
									n=n+1;
									~dna_clock = ("dna_clock_"++(n)).asSymbol.envirGet;
									~inst_num = n;
									~inst_clock_func.value;
								});
							});
						});

						(~number_of_parts_in_piece).do({

							1.do({~part_num = ~part_num + 1;

								~part_bit_size.do({

									~number_of_instruments.do(n = 0; {("dna_clock_"++(n=n+1)).asSymbol.envirPut(("dna_clock_"++(n)).asSymbol.envirGet+1);});
									~number_of_instruments.do(n = 0; {
										n=n+1;
										~dna_clock = ("dna_clock_"++(n)).asSymbol.envirGet;
										~inst_num = n;
										~inst_clock_func.value;
									});
								});
							});
						});

						"gen checkpoint 3".postln;
						//create pseq arrays function

						(
							~create_pseq_arrays_func = {

								h = 0.midicps;

								1.do({

									~number_of_instruments.do(x = 0; {("instrument_"++(x=x+1)++"_full_pseq_array").asSymbol.envirPut([]);});

									/*
									("instrument_"++(1)++"_full_pseq_array").asSymbol.envirGet.at(5800).size
									*/

									~number_of_instruments.do(x = 0; {
										x=x+1;
										~number_of_parts_in_piece.do(y = 0; {("instrument_"++(x)++"_full_pseq_array").asSymbol.envirPut(("instrument_"++(x)++"_full_pseq_array").asSymbol.envirGet.add(("instrument_"++(x)++"_array_part_"++(y=y+1)).asSymbol.envirGet););});
										("instrument_"++(x)++"_full_pseq_array").asSymbol.envirPut(("instrument_"++(x)++"_full_pseq_array").asSymbol.envirGet.flatten);
										("instrument_"++(x)++"_full_pseq_array_midi").asSymbol.envirPut(("instrument_"++(x)++"_full_pseq_array").asSymbol.envirGet);
										("instrument_"++(x)++"_full_pseq_array").asSymbol.envirPut(("instrument_"++(x)++"_full_pseq_array").asSymbol.envirGet.midicps);
										("instrument_"++(x)++"_full_pseq_array").asSymbol.envirPut(("instrument_"++(x)++"_full_pseq_array").asSymbol.envirGet.replace(h, 0));
									});

									"Piece Creation Is Finsihed".postln;

									if(~piece_created == nil, {~piece_created = "true";});
									AppClock.sched(0, {
										~playbutton_func.value;
										~piecegenerated.string = "piece generated";
										AppClock.sched(3, {~piecegenerated.close});
									});

									AppClock.sched(0, {
										~fullpiecedur1 = ((~piecedur_secs = (~number_of_parts_in_piece*~part_bit_size*~bit_duration).round)/60);
										~dd_secs = ((~fullpiecedur1-(~dd_mins = ~fullpiecedur1.roundUp-1))*60).roundUp;
										/*~fullpiecedur = ("piece length - "++(~dd_mins.asString)++":"++(if(~dd_secs<10,{"0"},{""})++~dd_secs.asString)++" mins");
										*/
										~fullpiecedur = ("piece length - "++(~piecedur_secs.asInteger.asString)++" secs ("++(~dd_mins.asInteger.asString)++":"++(if(~dd_secs<10,{"0"},{""})++~dd_secs.asInteger.asString)++" mins)");
										piecedurationstatictext.string = ~fullpiecedur;
										("\npiece duration: \n"++((~dd_mins.asInteger.asString)++":"++(if(~dd_secs<10,{"0"},{""})++~dd_secs.asInteger.asString))++" minutes";).postln;
										rangeslider.set(spec: ControlSpec(0, if(~piecedur_secs != nil, {~piecedur_secs}, {0}), \lin, 1, 50, "secs"), initVal: [0,if(~piecedur_secs != nil, {~piecedur_secs}, {0})]);
										timeslider.set(spec: ControlSpec(0, if(~piecedur_secs != nil, {~piecedur_secs}, {0}), \lin, 1, 50, "secs"));
										~rate_selection_start = 0;
										~rate_selection_end = ("instrument_"++(1)++"_full_pseq_array").asSymbol.envirGet.size;
									});

									if(~quicknewpiecebutton == 1, {
										AppClock.sched(0, {
											~quicknewpiecebutton = 0;
											~stopbuttonfunc.value;
											~playbutton.value = 1;
											~run_piece_func.value;
										});
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


	~klangarray1 = {Array.rand(3, 0, 20);};

	~number_of_instruments.do(x = 0; {
		SynthDef("synth"++(x=x+1), {arg freq = 432, freq1 = 60, amp = 0.1, detun = 1.006, ffreq = 800, rq = 1, gt = 1;
			var sig;
			sig = Mix(DynKlang.ar(`[ [freq]++~klangarray1.value+freq, nil, nil ], 1, 0) * 0.05);
			sig = RLPF.ar(sig, ffreq, rq);
			sig = sig * EnvGen.kr(
				Env.adsr(0.01, 0.1, 0.6, 0.1),
				gt
			);

			Out.ar(0, sig!2);
		}).add;
	});

	~run_piece_func = {

		(


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

			/*~timer_routine = Task(
			~dd_secs = ((~fullpiecedur1-(~dd_mins = ~fullpiecedur1.roundUp-1))*60).roundUp;
			~piecedur_secs = (~dd_mins*60)+~dd_secs;
			~piecedur_secs_zero = 0;
			{
			~piecedur_secs.do({
			AppClock.sched(0, {
			piecedurationstatictext.string = ("piece length - "++(~piecedur_secs_zero.asString)++" secs ("++(~dd_mins.asString)++":"++(if(~dd_secs<10,{"0"},{""})++~dd_secs.asString)++" mins)");
			~piecedur_secs_zero = ~piecedur_secs_zero+1;
			~dd_secs = ~dd_secs-1;
			if(~dd_secs == (-1), {~dd_mins = ~dd_mins-1; ~dd_secs = 59;});

			/*if(~piecedur_secs_zero >= 20, {rangeslider.valueAction = [~piecedur_secs_zero-20, ~piecedur_secs_zero]}, {rangeslider.valueAction = [0, ~piecedur_secs_zero]});
			*/timeslider.valueAction = ~piecedur_secs_zero;
			});

			1.wait;
			});
			});*/




			~duranduranbot_routine = Task({var bit_timer;
				bit_timer = 0;
				~dd_secs = ((~fullpiecedur1-(~dd_mins = ~fullpiecedur1.roundUp-1))*60).roundUp;
				~piecedur_secs = (~dd_mins*60)+~dd_secs;
				~piecedur_secs_zero = 0;

				1.do({

					if(~will_record == 1, {
						thisProcess.platform.recordingsDir = (Document.current.dir++"/other_stuff_(recordings_etc)/duranduranbot_recordings");
						Server.default.record;
						1.wait;
					});

					"piece currently running".postln;

					Server.default.makeBundle(Server.default.latency, {

						~number_of_instruments.do(~x = 0; {("duranduranbotsynth"++(~x=~x+1)).asSymbol.envirPut(
							Synth("synth"++(~x), [freq: ("instrument_"++(~x)++"_full_pseq_array").asSymbol.envirGet.at(~piece_position)]);

						);});


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

					~rate_selection_end = ~piece_position;
					~rate_selection_start = ~piece_position-(~auto_select_diff/~bit_duration);
					if(~rate_selection_start.isNegative == true, {~rate_selection_start = 0;});

					bit_timer = bit_timer + 1;
					if(bit_timer == 16, {
						AppClock.sched(0, {
							timeslider.valueAction = timeslider.value+1;
							~piecedur_secs_zero = ~piecedur_secs_zero+1;
							~dd_secs = ~dd_secs-1;
							if(~dd_secs == (-1), {~dd_mins = ~dd_mins-1; ~dd_secs = 59;});
							piecedurationstatictext.string = ("piece length - "++(~piecedur_secs_zero.asInteger.asString)++" secs ("++(~dd_mins.asInteger.asString)++":"++(if(~dd_secs<10,{"0"},{""})++~dd_secs.asInteger.asString)++" mins)");
							if(timeslider.value >= ~auto_select_diff, {rangeslider.valueAction = [timeslider.value-~auto_select_diff, timeslider.value]}, {rangeslider.valueAction = [0, timeslider.value]});

						});
						bit_timer = 0;

					});

					~bit_duration.wait;

				});

				(~instrument_1_full_pseq_array.size-1).do({

					~piece_position = ~piece_position + 1;

					Server.default.makeBundle(Server.default.latency, {

						~number_of_instruments.do(~x = 0; {("duranduranbotsynth"++(~x=~x+1)).asSymbol.envirGet.set(
							\freq, ("instrument_"++(~x)++"_full_pseq_array").asSymbol.envirGet.at(~piece_position);

						);});

						/*~duranduranbotsynth1_m.set(\freq, ~instrument_1_full_pseq_array_mirrored.at(i));
						~duranduranbotsynth2_m.set(\freq, ~instrument_2_full_pseq_array_mirrored.at(i));
						~duranduranbotsynth3_m.set(\freq, ~instrument_3_full_pseq_array_mirrored.at(i));
						*/
					});

					~rate_selection_end = ~piece_position;
					~rate_selection_start = ~piece_position-(~auto_select_diff/~bit_duration);
					if(~rate_selection_start.isNegative == true, {~rate_selection_start = 0;});

					bit_timer = bit_timer + 1;
					if(bit_timer == 16, {
						AppClock.sched(0, {
							timeslider.valueAction = timeslider.value+1;
							~piecedur_secs_zero = ~piecedur_secs_zero+1;
							~dd_secs = ~dd_secs-1;
							if(~dd_secs == (-1), {~dd_mins = ~dd_mins-1; ~dd_secs = 59;});
							piecedurationstatictext.string = ("piece length - "++(~piecedur_secs_zero.asInteger.asString)++" secs ("++(~dd_mins.asInteger.asString)++":"++(if(~dd_secs<10,{"0"},{""})++~dd_secs.asInteger.asString)++" mins)");
							if(timeslider.value >= ~auto_select_diff, {rangeslider.valueAction = [timeslider.value-~auto_select_diff, timeslider.value]}, {rangeslider.valueAction = [0, timeslider.value]});

						});
						bit_timer = 0;

					});

					~bit_duration.wait;

				});

				~stop_func.value;
				"piece finished".postln;

			});


			Server.default.makeBundle(Server.default.latency, {
				/*	~timer_routine.start;*/
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