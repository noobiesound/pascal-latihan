program pulsification;
uses crt;
const
  d = 587;
  dk = 622;
  g = 800;
  gk = 831;
  ak = 932;
  dk2 = 1245;

var
  num, num2, denom1, denom2, tempo1, tempo2, dur, durEx, ratio : real;
  a, b : array[1..10] of integer;
  temdec, durdec, numdec, dendec, i, layer, note : integer;
  konf, opt : char;

procedure music1;
begin
  sound(ak);
  delay(200);
  sound(dk);
  delay(200);
  sound(g);
  delay(200);
  sound(gk);
  delay(200);
  sound(ak);
  delay(200);
  sound(dk2);
  delay(200);
  sound(gk);
  delay(200);
  sound(g);
  delay(200);
  sound(dk);
  delay(1600);
  nosound;
end;

procedure music2;
begin
  sound(dk2);
  delay(200);
  sound(ak);
  delay(200);
  sound(gk);
  delay(200);
  sound(g);
  delay(200);
  sound(gk);
  delay(200);
  sound(g);
  delay(200);
  sound(dk);
  delay(200);
  sound(d);
  delay(200);
  sound(dk);
  delay(1600);
  nosound;
end;

procedure beep1;
begin
  sound(dk);
  delay(50);
  nosound;
end;

procedure beep2;
begin
  sound(g);
  delay(50);
  nosound;
end;

procedure warnfx;
begin
  sound(g);
  delay(400);
  nosound;
end;

procedure resultfx;
begin
  sound(dk);
  delay(100);
  sound(g);
  delay(100);
  sound(ak);
  delay(100);
  nosound;
end;

procedure success;
begin
  sound(ak);
  delay(100);
  sound(dk);
  delay(100);
  sound(ak);
  delay(100);
  sound(dk);
  delay(100);
  nosound;
end;

procedure greeting;
begin
  clrscr;
  delay(1000);
  for i := 1 to 15 do
  begin
    textbackground(i);
    clrscr;
    delay(90);
  end;
  delay(1000);
  textcolor(red);
  writeln('===============');
  writeln('|             |');
  writeln('| Welcome! :) |');
  writeln('|             |');
  writeln('===============');
  writeln;
  writeln('Opening Application ...');
  music1;
end;

procedure title;
begin
  textbackground(white);
  textcolor(magenta);
  clrscr;
  writeln('============================');
  writeln('|                          |');
  writeln('|       Pulsification      |');
  writeln('|           v1.3           |');
  writeln('|                          |');
  writeln('============================');
  writeln;
end;

procedure extrabeat;
begin
  if round(num) = num then
    begin
      textcolor(red);
      write('No');
    end
  else
    begin
      if round(num) > num then
        num2 := round(num) - 1
      else
        num2 := round(num);

      textcolor(green);
      write('Yes');

      tempo2 := (tempo1 * denom1) / 4;
      dur := 60 / tempo2;
      durEx := (num - num2) * dur;

      writeln;
      writeln;
      textcolor(red);
      writeln('Beat Duration');
      writeln('=============');
      writeln;
      textcolor(black);
      writeln('> Normally        : ', dur: 0: durdec, ' s / beat');
      writeln('> Extra Beat      : ', durEx: 0: durdec, ' s');
    end;
end;

procedure howtouse;
begin
  title;
  textcolor(black);
  writeln('==============');
  writeln('| How to Use |');
  writeln('==============');
  writeln;
  writeln('1. Choose one of choices that have been shown before.');
  writeln('2. If you want to convert time signature, choose 1.');
  writeln('   Once you have been there, you could input your');
  writeln('   data as you want. When the results appear, click');
  writeln('   Enter if you are done with that.');
  writeln('3. If you feel somewhat strange about the results');
  writeln('   have been shown, choose 4 to set your preferences.');
  writeln('   this feature let you to set the maximum decimals');
  writeln('   to be shown when you have done a conversion.');
  writeln('4. Choose 5 if you wanna know something about this');
  writeln('   program. Well, I do not think this is necessary');
  writeln('   at all.');
  writeln('5. Choose 6 if you wanna exit from this program.');
  write;
  write('6. '); textcolor(red); write('DO NOT ');
  textcolor(black); write('input the other characters while you are');
  writeln;
  writeln('   inputting information, because this will close');
  writeln('   automatically.');
  writeln('7. Feel free to edit this code, you can edit the .pas');
  writeln('   file there.');
  writeln;
  readln;
end;

procedure convert;
begin
  title;
  textcolor(green);
  writeln('=============================');
  writeln('| Time Signature Conversion |');
  writeln('=============================');
  textcolor(black);
  writeln;
  writeln('NOTE :');
  writeln('- This could be used for converting a time signature');
  writeln('  to the new different one (you might call it as');
  writeln('  "metric modulation").');
  writeln('- All data accept real numbers.');
  writeln;
  write('> Tempo (BPM)     : ');
  read(tempo1);
  beep2;
  write('> Numerator       : ');
  read(num);
  beep2;
  write('> Old Denominator : ');
  read(denom1);
  beep2;
  write('> New Denominator : ');
  read(denom2);

  tempo2 := (tempo1 * denom1) / denom2;

  textcolor(blue);
  writeln;
  writeln('Result');
  writeln('======');
  writeln;

  textcolor(black);
  writeln('> New Tempo       : ', tempo2: 0: temdec, ' BPM');
  writeln('> Time Signature  : ', num: 0: numdec, ' / ', denom2: 0: dendec);
  write('> Need Extra Beat : ');
  extrabeat;
  readln;
end;

procedure pref;
begin
  title;
  textcolor(brown);
  writeln('===============');
  writeln('| Preferences |');
  writeln('===============');
  writeln;
  textcolor(black);
  write('> Maximum Decimals on Tempo       (now is set on ',temdec,') : ');
  read(temdec);
  beep2;
  write('> Maximum Decimals on Numerator   (now is set on ',numdec,') : ');
  read(numdec);
  beep2;
  write('> Maximum Decimals on Denominator (now is set on ',dendec,') : ');
  read(dendec);
  beep2;
  write('> Maximum Decimals on Duration    (now is set on ',durdec,') : ');
  read(durdec);
  writeln;
  textcolor(green);
  writeln('Setting has been saved! Please Wait ...');
  success;
  delay(1000);
end;

procedure about;
begin
  title;
  textcolor(darkgray);
  writeln('Pulsification v1.3');
  writeln('Made by NoobieSound, written in Pascal');
  writeln;
  textcolor(black);
  writeln('This simple tool could help you to convert old time');
  writeln('signature into a new one, and do some calculations');
  writeln('about tuplets, etc. This might help you who wanna');
  writeln('make some "weirdness" into your composition.');
  writeln;
  writeln('Lemme know your comments about this, if I have done');
  writeln('some miscalculations here, contact me on :');
  textcolor(red);
  writeln('noobiesound.music@gmail.com');
  writeln;
  textcolor(blue);
  writeln('Support my YouTube channel and SoundCloud "NoobieSound"');
  writeln('Thank You!');
  writeln;
  resultfx;
  readln;
end;

procedure tuplet;
begin
  title;
  textcolor(red);
  writeln('=======================');
  writeln('| Tempo of The Pulses |');
  writeln('=======================');
  textcolor(black);
  writeln;
  writeln('NOTE :');
  writeln('- This could be used for calculating how much tempo is');
  writeln('  on each note in ratio-based tuplet grouping.');
  writeln('- Maximum layers is 10. And ratio is (a : b).');
  writeln('- Layers, ratio, and note accept integer numbers only.');
  writeln('- The rest accept real numbers.');
  writeln;
  write('> Amount of nested tuplets : ');
  read(layer);
  
  if layer > 10 then
  begin
	textcolor(red);
    writeln('Maximum layers is 10! Try again!');
	readln;
    warnfx;
    readln;
    tuplet;
  end
  
  else if layer < 1 then
  begin
	textcolor(red);
    writeln('Ratio can not be 0 nor negative! Try again!');
	readln;
    warnfx;
    readln;
    tuplet;
  end
  
  else
  begin
    for i := 1 to layer do
    begin
	  beep2;
	  write('> Ratio (a) in layer ',i,'     : ');
	  read(a[i]);
	  beep2;
	  write('> Ratio (b) in layer ',i,'     : ');
	  read(b[i]);
	end;

	beep2;
	write('> Kind of note (1/x)       : ');
	read(note);
	beep2;
	write('> Tempo                    : ');
	read(tempo1);
	ratio := 1;

	for i := 1 to layer do
	begin
	  ratio := ratio * (a[i] / b[i]);
	end;

	tempo2 := ratio * (note / 4) * tempo1;

	textcolor(blue);
	writeln;
	writeln('Result');
	writeln('======');
	writeln;
	textcolor(black);
	writeln('> New Tempo (1/4 note)     : ',tempo2: 0: temdec,' BPM');
	readln;
  end;
end;

procedure mainmenu;
begin
  title;
  textcolor(black);
  beep1;
  writeln('Menu : ');
  writeln;
  textcolor(blue);
  writeln('1. Time Signature Conversion');
  writeln('2. Tempo of Pulse in Nested Tuplets');
  writeln('3. How to Use');
  writeln('4. Preferences');
  writeln('5. About');
  writeln('6. Exit');
  writeln;
  textcolor(black);
  write('Your Choice [1-6] : ');
  read(opt);

  case opt of
    '1' :
	begin
      beep2;
      convert;
      resultfx;
	  readln;
      mainmenu;
    end;

	'2' :
	begin
      beep2;
      tuplet;
      resultfx;
	  readln;
      mainmenu;
    end;

    '3' :
    begin
      beep2;
      howtouse;
      readln;
      mainmenu;
    end;

	'4' :
	begin
      beep2;
      pref;
	  readln;
	  mainmenu;
	end;

	'5' :
	begin
	  about;
	  readln;
	  mainmenu;
	end;

	'6' :
	begin
      title;
      writeln;
      textcolor(green);
	  writeln('Thank you for using this program!');
	  music2;
	end;
	
	else
	begin
      textcolor(red);
      writeln('Wrong choice! Try again!');
	  readln;
      warnfx;
      readln;
	  mainmenu;
	end;
  end;
end;

begin
  temdec := 3;
  durdec := 3;
  numdec := 0;
  dendec := 0;
  greeting;
  mainmenu;
  readln;
end.