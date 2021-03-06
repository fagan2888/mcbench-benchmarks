function userhelp(subject,page)
% USERHELP On-Line Help facility for The Controls Tutor

% Author: Craig Borghesani
% Date: 11/26/94
% Revised:
% Copyright (c) 1999, Prentice-Hall

if subject == 0,
 f = gcf;
else
 f2 = gcf;
 f = get(f2,'userdata');
end
ui_data = get(f,'userdata');
ui_han = ui_data{1};
ui_obj = ui_data{2};
win_str = get(ui_han(48),'userdata');
ui_han2 = get(ui_han(53),'userdata');

if ~figflag(['Controls Tutor Help',win_str]) | subject == 0, % initial page/setup

 if ~figflag(['Controls Tutor Help',win_str]),
  scrn_size = get(0,'screensize');
  fig_h = 378;
  fig_w = 498;
  fig_lft = (scrn_size(3) - fig_w)/2;
  fig_btm = (scrn_size(4) - (fig_h+20))/2;

  f2 = figure('pos',[fig_lft,fig_btm,fig_w,fig_h],'numbertitle','off','menubar','none',...
              'name',['Controls Tutor Help',win_str],'userdata',f);

  ui_han2(1) = uicontrol('style','text','pos',[5,331,488,17],...
              'horizontalalignment','center','foregroundcolor','k',...
              'backgroundcolor',[0.8,0.8,0.8]);
  ui_han2(2) = uicontrol('style','edit','pos',[5,5,488,323],...
              'horizontalalignment','left','enable','inactive','max',2,...
              'background','w');

  ui_han2(3) = uicontrol('style','push','pos',[20,353,60,20],...
              'string','Close','callback','set(gcf,''vis'',''off'')');
  ui_han2(4) = uicontrol('style','push','pos',[149,353,60,20],...
              'string','Next >>');
  ui_han2(5) = uicontrol('style','push','pos',[86,353,60,20],...
              'string','<< Prev');

  popup_str = ['Introduction|Program Conventions|Input Center|File Menu|',...
               'Options Menu|Format Menu|View Menu|Frequency Response|',...
               'Root Locus|Gain Plots|Time Response|Getting HELP'];

  ui_han2(6) = uicontrol('style','popup','pos',[214,353,160,20],'string',...
                     popup_str,'callback','userhelp(1)','backgroundcolor','w');

  set(ui_han2,'units','norm');

  set(ui_han(53),'userdata',ui_han2);

 end

 if subject == 0,  subject = 2; end

end

lab_han = ui_han2(1);
txt_han = ui_han2(2);
nxt_han = ui_han2(4);
prv_han = ui_han2(5);
pop_han = ui_han2(6);

cr = sprintf('\n');
tab = [32,32,32];

if subject == 1,
 subject = get(pop_han,'value')+1;
 page = 1;
else
 set(pop_han,'value',subject-1);
end

if subject == 2, % Introduction

 set(lab_han,'string','Introduction - page 1 of 1');
 str = [cr,'Welcome to the Controls Tutor On-line Help',cr,...
        cr,...
        'The Controls Tutor On-line Help facility provides you with a quick',cr,...
        'and easy reference to the many options provided by the Controls Tutor.',cr,...
        cr,...
        'Use the << Prev and Next >> buttons to turn the pages of this Help',cr,...
        'facility.',cr,...
        cr,...
        'Use the popup menu to select a specific area that you need help with.',cr,...
        cr,...
        'Words that are capitalized and separated with a -> represent pulldown',cr,...
        'menu options.  For example, FILE->OPEN means to select the Open option',cr,...
        'under the File pulldown menu.',cr,...
        cr,...
        'It is recommended that if you do not have a manual that you should',cr,...
        'quickly browse this Help facility.'];

 set(txt_han,'string',str);
 set(prv_han,'enable','off');
 set(nxt_han,'callback','userhelp(3,1)','enable','on');

elseif subject == 3, % Program Conventions

 if page == 1,
  set(prv_han,'enable','on','callback','userhelp(2,1)');
  set(nxt_han,'enable','on','callback','userhelp(3,2)');

  set(lab_han,'string','Program Conventions - page 1 of 5');

  str = [cr,...
         'The conventions for the Controls Tutor can be broken up into 5',cr,...
         'subject areas:',cr,...
         cr,...
         tab,'Screen Layout',cr,...
         tab,'Current Items',cr,...
         tab,'System',cr,...
         tab,'Element',cr,...
         tab,'Mouse',cr,...
         cr,...
         'Screen Layout',cr,...
         '------------------------',cr,...
         cr,...
         'The screen layout consists of the following:',cr,...
         cr,...
         tab,'Menus - Pull down menus defining all available options.',cr,...
         cr,...
         tab,'Input Center - Tools provided for manipulating transfer function',cr,...
         tab,'elements.  Located in the upper-left hand corner.'];

  set(txt_han,'string',str);

 elseif page == 2,
  set(prv_han,'enable','on','callback','userhelp(3,1)');
  set(nxt_han,'enable','on','callback','userhelp(3,3)');

  set(lab_han,'string','Program Conventions - page 2 of 5');

  str = [cr,...
         tab,'Pointer Location - Display of mouse location.  Located below',cr,...
         tab,'current plot button.',cr,...
         cr,...
         tab,'System Information - Various information regarding the current',cr,...
         tab,'system.  Located below current system info button.',cr,...
         cr,...
         tab,'Transfer Function - Display of accepted elements.  Located at',cr,...
         tab,'the top of the page.',cr,...
         cr,...
         tab,'Page - Display area that contains all plotting environments.',cr,...
         cr,...
         tab,'Status Bar - Display of program status.',cr,...
         cr,...
         'Current Items',cr,...
         '-----------------------',cr,...
         cr,...
         'The Controls Tutor works with a number of ''current'' items: the',cr,...
         'current system, the current transfer function, and the current',cr,...
         'plot'];

  set(txt_han,'string',str);

 elseif page == 3,
  set(prv_han,'enable','on','callback','userhelp(3,2)');
  set(nxt_han,'enable','on','callback','userhelp(3,4)');

  set(lab_han,'string','Program Conventions - page 3 of 5');

  str = [tab,'The current system is one of the three systems that are provided',cr,...
         tab,'by the Controls Tutor.  The System Information section tells you what',cr,...
         tab,'system you are currently modifying.  If you display all the systems,',cr,...
         tab,'the current system will be green and the non-current red.',cr,...
         cr,...
         tab,'The current transfer function is one of the three transfer functions',cr,...
         tab,'provided by the Controls Tutor: plant, forward controller, or feed-',cr,...
         tab,'back controller.  The Input Center section indicates what transfer',cr,...
         tab,'function you are currently modifying.',cr,...
         cr,...
         tab,'The current plot is one of the plots that is displayed on your page.',cr,...
         tab,'The Pointer Location section indicates what plot you are currently',cr,...
         tab,'allowed to modify.'];

  set(txt_han,'string',str);

 elseif page == 4,
  set(prv_han,'enable','on','callback','userhelp(3,3)');
  set(nxt_han,'enable','on','callback','userhelp(3,5)');

  set(lab_han,'string','Program Conventions - page 4 of 5');

  str = [cr,...
         'System',cr,...
         '------------',cr,...
         cr,...
         tab,'The Controls Tutor defines a system as containing a forward',cr,...
         tab,'controller, G(s), a plant, P(s), and a feedback controller, H(s).',cr,...
         tab,'Hence, the open-loop equation would be G(s)P(s)H(s) and the',cr,...
         tab,'closed-loop equation would be G(s)P(s)/(1 + G(s)P(s)H(s)).',cr,...
         cr,...
         tab,'The Controls Tutor allows you to work with up to 3 separate systems.',cr...
         cr,...
         'Element',cr,...
         '---------------',cr,...
         cr,...
         tab,'The Controls Tutor defines an element as a component of a transfer',cr,...
         tab,'function.  For example, integrators, real poles, and complex zeros',cr,...
         tab,'are all elements.'];

  set(txt_han,'string',str);

 elseif page == 5,
  set(prv_han,'enable','on','callback','userhelp(3,4)');
  set(nxt_han,'enable','on','callback','userhelp(4,1)');

  set(lab_han,'string','Program Conventions - page 5 of 5');

  str = [cr,...
         'Mouse',cr,...
         '-----------',cr,...
         cr,...
         tab,'The Controls Tutor makes extensive use of the mouse.  The mouse',cr,...
         tab,'can be used to identify parts of a plot and also select elements',cr,...
         tab,'from a displayed transfer function.  It can also be used to switch',cr,...
         tab,'between systems by double-clicking on a non-current system.',cr,...
         cr,...
         tab,'The results of a mouse selection are displayed both in the Status',cr,...
         tab,'Bar and Pointer Location.'];

  set(txt_han,'string',str);
 end

elseif subject == 4, % Input Center

 if page == 1,
  set(prv_han,'enable','on','callback','userhelp(3,5)');
  set(nxt_han,'enable','on','callback','userhelp(4,2)');

  set(lab_han,'string','The Input Center - page 1 of 2');

  str = [cr,...
         'The Input Center gives you the interface to enter various',cr,...
         'transfer function elements.  This is accomplished with the following',cr,...
         'interface objects:',cr,...
         cr,...
         tab,'Popup Menu - used to choose your transfer function element',cr,...
         tab,'Edit Boxes - used to enter values related to your chosen element',cr,...
         tab,'Sliders - used to iterate over values of selected elements',cr,...
         tab,'Add/Update Button - used to accept values in edit boxes',cr,...
         tab,'Delete Button - used to remove selected element',cr,...
         cr,...
         'The Input Center is placed into Add mode when an element is selected',cr,...
         'using the Popup Menu.',cr,...
         cr,...
         'The Input Center is placed into Update mode when an element is',cr,...
         'selected using the mouse pointer.  This is accomplished by depressing',cr,...
         'the mouse button while over the desired element in the displayed',cr,...
         'transfer function.  However, in order for you to select the element,',cr,...
         'the transfer function must be displayed with FORMAT->INDIVIDUAL and',cr,...
         'FORMAT->FACTORED selected.'];

  set(txt_han,'string',str);

 elseif page == 2,
  set(prv_han,'enable','on','callback','userhelp(4,1)');
  set(nxt_han,'enable','on','callback','userhelp(5,1)');

  set(lab_han,'string','The Input Center - page 2 of 2');

  str = [cr,...
         'Transfer function elements provided by the popup menu:',cr,...
         cr,...
         'Gain - update the gain of the current transfer function.',cr,...
         'Integrator - enter the number (n) of integrators for 1/s^n.',cr,...
         'Differentiator - enter the number (n) of differentiators for s^n.',cr,...
         'Real Pole - enter the pole value (p) for 1/(s + p).',cr,...
         'Real Zero - enter the zero value (z) for (s + z).',cr,...
         'Complex Pole - enter zeta and wn for 1/(s^2 + 2*zeta*wn*s + wn^2).',cr,...
         'Complex Zero - enter zeta and wn for (s^2 + 2*zeta*wn*s + wn^2).',cr,...
         'Lead/Lag - enter the phase change and corner frequency.',cr,...
         'Num/Den - enter the numerator and denominator in descending powers',cr,...
         tab,tab,'of s and enclosed in brackets. i.e. [1, 2, 3]',cr,...
         'Delay Time - enter the time value (T) for exp(-s*T).',cr,...
         'Design Point - enter the zeta value and wn value.  These values will',cr,...
         tab,tab,'then be applied to the root locus plot in the form of a zeta',cr,...
         tab,tab,'line and wn circle.'];

  set(txt_han,'string',str);
 end

elseif subject == 5, % File Menu

 if page == 1,
  set(prv_han,'enable','on','callback','userhelp(4,2)');
  set(nxt_han,'enable','on','callback','userhelp(5,2)');

  set(lab_han,'string','The File Menu - page 1 of 3');

  str = [cr,...
         'The File menu controls all the operations involving the disk,',cr,...
         'MATLAB workspace, printer, and exiting the Controls Tutor.',cr,...
         cr,...
         'NEW clears The Controls Tutor environment.',cr,...
         cr,...
         'OPEN... displays a dialog box that allows you to select a',cr,...
         'Tutor file which was saved with the SAVE option.',cr,...
         cr,...
         'SAVE saves the current transfer function settings.  If',cr,...
         'it is a [Untitled], then the SAVE AS... option is invoked.',cr,...
         cr,...
         'SAVE AS... displays a dialog box that allows you to specify a file',cr,...
         'name to store your Controls Tutor transfer function settings. Tutor',cr,...
         'files are designated with the *.tut extension.'];

  set(txt_han,'string',str);

 elseif page == 2,
  set(prv_han,'enable','on','callback','userhelp(5,1)');
  set(nxt_han,'enable','on','callback','userhelp(5,3)');

  set(lab_han,'string','The File Menu - page 2 of 3');

  str = [cr,...
         'IN FROM WORKSPACE... allows you to take variables from the',cr,...
         'MATLAB workspace and pass them into the Controls Tutor to define',cr,...
         'any of the three transfer functions.',cr,...
         cr,...
         'The formats and transfer functions are selected using the provided',cr,...
         'radio buttons and pressing OK brings the data into the transfer function.',cr,...
         cr,...
         'There are three different formats which the Controls Tutor can accept:',cr,...
         'Num/Den, Zero/Pole/Gain, and State-Space.  Each of these formats can',cr,...
         'then be passed into the selected transfer function: plant, forward',cr,...
         'controller, or feedback controller.  To specify two different transfer',cr,...
         'functions, you need to choose this option twice.',cr,...
         cr,...
         'Note: the Controls Tutor can only handle SISO systems.  If you try to',cr,...
         'pass in a MIMO system, the Tutor will only take the transfer function',cr,...
         'related to the first input.'];

  set(txt_han,'string',str);

 elseif page == 3,
  set(prv_han,'enable','on','callback','userhelp(5,2)');
  set(nxt_han,'enable','on','callback','userhelp(6,1)');

  set(lab_han,'string','The File Menu - page 3 of 3');

  str = [cr,...
         'OUT TO WORKSPACE... works the same as IN FROM WORKSPACE... except',cr,...
         'that it places its results into the MATLAB workspace with your specified',cr,...
         'variable names.',cr,...
         cr,...
         'PRINT prints all graphical information currently displayed:',cr,...
         'transfer function, plots, pointer location, and system information.',cr,...
         cr,...
         'EXIT ends the Controls Tutor session.'];

  set(txt_han,'string',str);

 end

elseif subject == 6, % Options Menu

 if page == 1,
  set(prv_han,'enable','on','callback','userhelp(5,3)');
  set(nxt_han,'enable','on','callback','userhelp(6,2)');

  set(lab_han,'string','The Options Menu - page 1 of 3');

  str = [cr,...
         'The Options menu determines the current system, current transfer',cr,...
         'function, and type of controller.',cr,...
         cr,...
         'SYSTEM allows you to switch between the 3 systems provided',cr,...
         'by the Controls Tutor.  The SHOW OTHERS option allows you view all',cr,...
         '3 systems at one time.  The current system will be green and the non-',cr,...
         'current systems will be red.',cr,...
         cr,...
         'Moving between systems can be done by using this menu option, double-',cr,...
         'clicking on a non-current system with the mouse, or pressing the',cr,...
         'System # Info button at the left.',cr,...
         cr,...
         'PLANT, P(S) allows you to set the plant of the current system',cr,...
         'as the displayed transfer function.'];

  set(txt_han,'string',str);

 elseif page == 2,
  set(prv_han,'enable','on','callback','userhelp(6,1)');
  set(nxt_han,'enable','on','callback','userhelp(6,3)');

  set(lab_han,'string','The Options Menu - page 2 of 3');

  str = [cr,...
         'FORWARD CONTROLLER, G(S) allows you to set the forward',cr,...
         'controller of the current system as the displayed transfer function.',cr,...
         cr,...
         'FEEDBACK CONTROLLER, H(S) allows you to set the feedback',cr,...
         'controller of the current system as the displayed transfer function.',cr,...
         cr,...
         'SET G(S) = 1 allows you to set the forward controller to',cr,...
         'one.  This option changes depending upon which transfer function is',cr,...
         'current.  If the forward controller were current, then this option',cr,...
         'would be SET P(S) = 1.',cr,...
         cr,...
         'SET H(S) = 1 allows you to set the feedback controller to',cr,...
         'one.  This option changes depending upon which transfer function is',cr,...
         'current.  If the feedbacl controller were current, then this option',cr,...
         'would be SET G(S) = 1.'];

  set(txt_han,'string',str);

 elseif page == 3,
  set(prv_han,'enable','on','callback','userhelp(6,2)');
  set(nxt_han,'enable','on','callback','userhelp(7,1)');

  set(lab_han,'string','The Options Menu - page 3 of 3');

  str = [cr,...
         'CONTROLLER TYPE allows you to change the format of your',cr,...
         'controller from a num/den format to one of two PID (proportional-',cr,...
         'integral-derivative) formats.',cr,...
         cr,...
         'The first PID format is of the basic equation:',cr,...
         cr,...
         'G(s) = Kp + Ki/s + Kds',cr,...
         cr,...
         'The second PID format is a manipulation of the first and is made up',cr,...
         'of a PD component and a PI component and has the following equation:',cr,...
         cr,...
         'G(s) = (1 + KDs)(KP + KI/s)',cr,...
         cr,...
         'where',cr,...
         cr,...
         'Kp = KP + KD*KI',cr,...
         'Ki = KI',cr,...
         'Kd = KD*KP'];

  set(txt_han,'string',str);

 end
elseif subject == 7, % Format Menu

 if page == 1,
  set(prv_han,'enable','on','callback','userhelp(6,3)');
  set(nxt_han,'enable','on','callback','userhelp(8,1)');

  set(lab_han,'string','The Format Menu - page 1 of 1');

  str = [cr,...
         'The Format menu controls how you want to view the current',cr,...
         'transfer function.  The first three options and the second three',cr,...
         'options are separated so that you can mix and match to determine',cr,...
         'your desired format.',cr,...
         cr,...
         'INDIVIDUAL allows you to display the current transfer',cr,...
         'function.',cr,...
         cr,...
         'OPEN-LOOP allows you to display the current system''s',cr,...
         'open-loop transfer function.',cr,...
         cr,...
         'CLOSED-LOOP allows you to display the current system''s',cr,...
         'closed-loop transfer function.',cr,...
         cr,...
         'FACTORED allows you to display the transfer function in',cr,...
         'elemental form.',cr,...
         cr,...
         'POLYNOMIAL allows you to display the transfer function in',cr,...
         'descending powers of s.',cr,...
         cr,...
         'INVERSE LAPLACE allows you to display the transfer function',cr,...
         'in its inverse Laplace form.'];

  set(txt_han,'string',str);
 end

elseif subject == 8, % View Menu

 if page == 1,
  set(prv_han,'enable','on','callback','userhelp(7,1)');
  set(nxt_han,'enable','on','callback','userhelp(8,2)');

  set(lab_han,'string','The View Menu - page 1 of 2');

  str = [cr,...
         'The View Menu allows you to control the axis limits, turn the grid',cr,...
         'on or off, and change The Control''s Tutor page layout.',cr,...
         cr,...
         'FULL allows you to set the axis limits so that all visible',cr,...
         'objects can be viewed.',cr,...
         cr,...
         'IN allows you to zoom in by 20%.',cr,...
         cr,...
         'OUT allows you to zoom out by 20%.',cr,...
         cr,...
         'ZOOM allows you to define a specific region to be your new',cr,...
         'axis limits.  When selected, the mouse pointer will change into a',cr,...
         'crosshair.  Press and drag the mouse to change the bounding box that',cr,...
         'appears; releasing the mouse button will change the axis limits.'];

  set(txt_han,'string',str);

 elseif page == 2,
  set(prv_han,'enable','on','callback','userhelp(8,1)');
  set(nxt_han,'enable','on','callback','userhelp(9,1)');

  set(lab_han,'string','The View Menu - page 2 of 2');

  str = [cr,...
         'LAST returns you to the previously defined axis limits.',cr,...
         cr,...
         'GRID allows you to toggle the grids on or off for the current',cr,...
         'axis.',cr,...
         cr,...
         'PAGE LAYOUT... allows you to change which plots you want, and',cr,...
         'on what pages you want them.',cr,...
         cr,...
         'The Controls Tutor has 8 pages that plots can be placed on.  Each page',cr,...
         'can hold up to 4 plots.  You move from page to page with the popup',cr,...
         'menu on the left.  Plot selection is performed by selecting from the',cr,...
         'list of 8 plots.  A plot is selected when its background color changes',cr,...
         'from white to its unique color.  At the same time, you will see the same',cr,...
         'color patch appear on the sample page to the right.  Page configurations',cr,...
         'are changed by selecting and dragging the patch objects.',cr,...
         cr,...
         'Clear - clears all plots from all pages.',cr,...
         'Default - returns all pages to their default layouts.'];

  set(txt_han,'string',str);

 end
elseif subject == 9, % Frequency Response

 if page == 1,
  set(prv_han,'enable','on','callback','userhelp(8,2)');
  set(nxt_han,'enable','on','callback','userhelp(9,2)');

  set(lab_han,'string','Frequency Response - page 1 of 2');

  str = [cr,...
         'The Tools Menu for Frequency Response are independent choices',cr,...
         'and toggle between checked and unchecked.  When an option is',cr,...
         'selected it becomes checked.  The Controls Tutor will always',cr,...
         'display that option until it becomes deselected, or unchecked.',cr,...
         cr,...
         'OPEN-LOOP allows you to display the open-loop frequency response.',cr,...
         cr,...
         'CLOSED-LOOP allows you to display the closed-loop frequency response.',cr,...
         cr,...
         'EXACT allows you to display the exact frequency response.',cr,...
         cr,...
         'STRAIGHT-LINE allows you to display the straight line approximation',cr,...
         'of the frequency response.  This option is only applicable to the',cr,...
         'Bode plots.'];

  set(txt_han,'string',str);

 elseif page == 2,
  set(prv_han,'enable','on','callback','userhelp(9,1)');
  set(nxt_han,'enable','on','callback','userhelp(10,1)');

  set(lab_han,'string','Frequency Response - page 2 of 2');

  str = [cr,...
         'MARGINS allows you to display the gain and phase margins of the',cr,...
         'frequency response.',cr,...
         cr,...
         'FREQUENCY... allows you to change the current working frequency',cr,...
         'vector.  The frequency vector is defined in the same manner as MATLAB''s',cr,...
         'logspace function.  The first and second edit boxes define the beginning',cr,...
         'and ending frequencies (log base10) and the third defines the number',cr,...
         'of frequencies to span this range.  For example, we could enter a -2',cr,...
         'in the first edit box, a -3 in the second, and a 100 in the third.',cr,...
         'This would define a frequency vector from 10^-2 (0.01) to 10^3 (1000)',cr,...
         'with a length of 100.'];

  set(txt_han,'string',str);

 end
elseif subject == 10, % Root Locus

 if page == 1,
  set(prv_han,'enable','on','callback','userhelp(9,2)');
  set(nxt_han,'enable','on','callback','userhelp(10,2)');

  set(lab_han,'string','Root Locus - page 1 of 3');

  str = [cr,...
         'The Tools Menu for Root Locus are independent choices and',cr,...
         'toggle between checked and unchecked.  When an option is',cr,...
         'selected it becomes checked.  The Controls Tutor will always',cr,...
         'display that option until it becomes deselected, or unchecked.',cr,...
         cr,...
         'POSITIVE LOCUS allows you to set all computations to be for the',cr,...
         'positive root locus, meaning the gain values range from 0 to +inf.',cr,...
         cr,...
         'NEGATIVE LOCUS allows you to set all computations to be for the',cr,...
         'negative root locus, meaning the gain values range from 0 to -inf.',cr,...
         cr,...
         'REAL AXIS allows you to display the real axis root loci.',cr,...
         cr,...
         'ASYMPTOTES allows you to display the asymptotes of the root locus.',cr,...
         cr,...
         'BREAKAWAY-REENTRY allows you to display where the root loci either',cr,...
         'breakaway or reenter the real axis.'];

  set(txt_han,'string',str);

 elseif page == 2,
  set(prv_han,'enable','on','callback','userhelp(10,1)');
  set(nxt_han,'enable','on','callback','userhelp(10,3)');

  set(lab_han,'string','Root Locus - page 2 of 3');

  str = [cr,...
         'IMAGINARY CROSSINGS allows you to display where the root loci cross',cr,...
         'the imaginary axis.',cr,...
         cr,...
         'ARRIVAL-DEPARTURE allows you to display the arrival and departure',cr,...
         'angles in degrees from complex zeros and poles, respectively.',cr,...
         cr,...
         'ROOT LOCUS allows you to compute the entire root locus of the current',cr,...
         'system',cr,...
         cr,...
         'CLOSED-LOOP POLES allows you to display the location of the closed-',cr,...
         'loop poles for the current system.'];

  set(txt_han,'string',str);

 elseif page == 3,
  set(prv_han,'enable','on','callback','userhelp(10,2)');
  set(nxt_han,'enable','on','callback','userhelp(11,1)');

  set(lab_han,'string','Root Locus - page 3 of 3');

  str = [cr,...
         'GAIN... allows you to manually set the gains used to compute the root',cr,...
         'locus.  The gain vector is defined in the same manner as MATLAB''s',cr,...
         'logspace function.  The first and second edit boxes define the beginning',cr,...
         'and ending gains (log base10) and the third defines the number of gains',cr,...
         'to span this range.  For example, we could enter a -2 in the first',cr,...
         'edit box, a -3 in the second, and a 100 in the third.  This would',cr,...
         'define a gain vector from 10^-2 (0.01) to 10^3 (1000) with a length',cr,...
         'of 100.',cr,...
         cr,...
         'The Auto-Select option tells the Controls Tutor to iteratively select',cr,...
         'its own gain values.  If this option is selected, all values in the',cr,...
         'edit boxes are cleared.'];

  set(txt_han,'string',str);
 end

elseif subject == 11, % Gain Plots

 if page == 1,
  set(prv_han,'enable','on','callback','userhelp(10,2)');
  set(nxt_han,'enable','on','callback','userhelp(12,1)');

  set(lab_han,'string','Gain Plots - page 1 of 1');

  str = [cr,...
         'The gain plots are related to root locus in the same way that bode',cr,...
         'plots are related to nyquist.  For nyquist and root locus, the vary-',cr,...
         'ing parameters, frequency and gain, respectively, are implicit; you',cr,...
         'cannot readily see which value of the result corresponds to the value',cr,...
         'of the parameter.  However, in bode and gain plots, this varying',cr,...
         'parameter is displayed along the x-axis and the corresponding result',cr,...
         'is split into a magnitude and phase component and displayed along the',cr,...
         'y-axis.  Hence, gain plots display the magnitude and phase component',cr,...
         'of the closed-loop roots of the characteristic equation.',cr,...
         cr,...
         'The only tools supplied for the gain plots is the ROOT LOCUS->GAIN...',cr,...
         'option.  Press the << Prev button for a description.'];

  set(txt_han,'string',str);

 end
elseif subject == 12, % Time Response

 if page == 1,
  set(prv_han,'enable','on','callback','userhelp(11,1)');
  set(nxt_han,'enable','on','callback','userhelp(12,2)');

  set(lab_han,'string','Time Response - page 1 of 3');

  str = [cr,...
         'The Tools Menu for Time Response are independent choices and',cr,...
         'toggle between checked and unchecked.  When an option is',cr,...
         'selected it becomes checked.  The Controls Tutor will always',cr,...
         'display that option until it becomes deselected, or unchecked.',cr,...
         cr,...
         'OPEN-LOOP allows you to display all the selected inputs with the',cr,...
         'open-loop transfer function.',cr,...
         cr,...
         'CLOSED-LOOP allows you to display all the selected inputs with the',cr,...
         'closed-loop transfer function.',cr,...
         cr,...
         'UNIT IMPULSE allows you to display the current system''s response to',cr,...
         'a unit impulse input.',cr,...
         cr,...
         'UNIT STEP allows you to display the current system''s response to a',cr,...
         'unit step input.',cr,...
         cr,...
         'UNIT RAMP allows you to display the current system''s response to a',cr,...
         'unit ramp input.'];

  set(txt_han,'string',str);

 elseif page == 2,
  set(prv_han,'enable','on','callback','userhelp(12,1)');
  set(nxt_han,'enable','on','callback','userhelp(12,3)');

  set(lab_han,'string','Time Response - page 2 of 3');
  str = [cr,...
         'RISE TIME allows you to display the rise time for the open- or',cr,...
         'closed-loop step response.  The rise time is the time required for',cr,...
         'the underdamped response to rise from 10 to 90% of its final value;',cr,...
         'or the overdamped response to rise from 0 to 100% of its final value',cr,...
         cr,...
         'DELAY TIME allows you to display the delay time for the open- or',cr,...
         'closed-loop step response.  The delay time is the time required for',cr,...
         'the response to reach half the final value the very first time.',cr,...
         cr,...
         'PEAK TIME allows you to display the peak time for the open- or',cr,...
         'closed-loop step response.  The peak time is the time required for',cr,...
         'the response to reach the first peak.  If the system is over-damped,',cr,...
         'peak time can not be computed.',cr,...
         cr,...
         '% OVERSHOOT allows you to display the percent overshoot for the open-',cr,...
         'or closed-loop step response.  The percent overshoot is the precentage',cr,...
         'amount that the response proceeds beyond the desired response.'];

  set(txt_han,'string',str);

 elseif page == 3,
  set(prv_han,'enable','on','callback','userhelp(12,2)');
  set(nxt_han,'enable','on','callback','userhelp(13,1)');

  set(lab_han,'string','Time Response - page 3 of 3');
  str = [cr,...
         '2% SETTLING allows you to display the 2% settling time for the open-',cr,...
         'or closed-loop step response.  The 2% settling time is the time',cr,...
         'required for the response curve to reach and stay within a 2% range',cr,...
         'about the final value.',cr,...
         cr,...
         '5% SETTLING allows you to display the 5% settling time for the open-',cr,...
         'or closed-loop step response.  The 5% settling time is the time',cr,...
         'required for the response curve to reach and stay within a 5% range',cr,...
         'about the final value.',cr,...
         cr,...
         'TIME... allows you to set the values at which to compute the time',cr,...
         'response.  The time vector is defined in the same manner as MATLAB''s',cr,...
         'linspace function.  The first and second edit boxes define the be-',cr,...
         'ginning and ending time values and the third defines the number of',cr,...
         'time values to span this range.'];

  set(txt_han,'string',str);

 end

elseif subject == 13, % Getting HELP

 if page == 1,
  set(prv_han,'enable','on','callback','userhelp(12,3)');
  set(nxt_han,'enable','off');

  set(lab_han,'string','Getting HELP - page 1 of 1');

  str = [cr,...
         'If you encounter problems either related to software or a general',cr,...
         'misunderstanding, send email to the appropriate address:',cr,...
         cr,...
         tab,'info@terasoft.com',cr...
         tab,'support@terasoft.com',cr,...
         tab,'suggest@terasoft.com',cr,...
         tab,'bugs@terasoft.com',cr,...
         cr,...
         'If this is an illegal copy, please consider purchasing the program',cr...
         'through proper channels so that you can become a registered user.'];

  set(txt_han,'string',str);

 end
end