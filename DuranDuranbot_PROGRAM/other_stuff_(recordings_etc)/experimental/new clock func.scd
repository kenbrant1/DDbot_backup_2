~inst_clock_func = {

					if(~dna_clock_y == ~dna_index_choice.asInteger, {
						~put_x = ([1,2,3]).wchoose([1/3,1/3,1/3]);
						case
						{~put_x == 1}{

							("instrument_"++(~inst_num)++"_if_zero").asSymbol.envirPut("false");

							~new_interval = ~interval_array.wchoose(((("inst_"++(~inst_num)).asSymbol.envirGet)++"__"++(
								case
								{~player_array.at(0) == "player_1"}{("instrument_"++(~inst_num)++"_freq").asSymbol.envirPut(}
								{~player_array.at(1) == "player_1"}{~place2}
								{~player_array.at(2) == "player_1"}{~place3};
							)++"_"++(
								case
								{~player_array.at(0) == "player_2"}{~place1}
								{~player_array.at(1) == "player_2"}{~place2}
								{~player_array.at(2) == "player_2"}{~place3};
							)++"_"++(
								case
								{~player_array.at(0) == "player_3"}{~place1}
								{~player_array.at(1) == "player_3"}{~place2}
								{~player_array.at(2) == "player_3"}{~place3};
							)++"_weights.scd").asSymbol.envirGet;);


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

					~put1.value;

				};