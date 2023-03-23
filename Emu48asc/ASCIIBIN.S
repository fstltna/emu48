TITLE ASCIIBIN ASCII<->Binary Converter

* Author: Eric Rechlin

ASSEMBLE
  NIBASC /HPHP49-C/
*  NIBASC /HPHP48-R/

RPL
::
  CK1NoBlame		( one argument, attribute errors correctly )
  CK&DISPATCH1		( one argument... )
  THREE			( ...check if it's a string )
  ::
    DUP			( duplicate string )
    ELEVEN		( last character + 1 to pull out )
    1_#1-SUB$		( pull out string of first characters )
    "%%HP:"		( test string )
    ONE			( search from first position )
    POS$		( find position of test string )
    DUP			( duplicate position )
    #0=?SKIP		( if header doesn't exist, skip secondary )
    ::
      #5+		( skip "%%HP:" header )
      LAST$		( pull out the rest of the string on level three )
      DUP		( duplicate string )
      ";"		( substring to find )
      ONE		( search from first position )
      POS$		( find position of substring )
      2DUP		( duplicate string and position )
      #1+		( add one to bint...this is first char to take )
      LAST$		( pull out the rest of the string on level three )
      UNROT		( 3 2 1 ->  1 3 2 )
      1_#1-SUB$		( take out the Kermit header at given position )
      DUPLEN$		( get length of header while keeping header on stack )
      THIRTEEN #=	( header should be 13 characters long )
      ?SKIP		( don't error if header string is 13 characters long )
      SETSIZEERR	( otherwise, give Bad Argument Value error )
      RCLSYSF		( back up system flags to hex string in level one )
      UNROT		( move flags backup to level 3 to get them out of the way )
      DUP		( duplicate header )
      FOUR		( " T(3)A(R)F(.)" )
      SUB$1#		(     ^ to ASCII code )
      FORTYEIGHT	( ASCII code for 0 is 48d )
      #-		( subtract 48 from ASCII code to get 0 through 3 )
      UNCOERCE		( convert bint to real )
      DOTRANSIO		( set ASCII translation mode to real on level one )
      DUP		
      EIGHT		( " T(3)A(R)F(.)" )
      SUB$1#		(         ^ to ASCII code )
      DUP		( duplicate ASCII code for D/R/G )
      #52		( ASCII code for R is 82d (52h) )
      #=		( is it in radians mode? )
      ITE		( do next semi if true, or the next one if false )
      ::
        SEVENTEEN	( radians mode: flag -17 )
        SetSysFlag	( set system flag -17 )
        DROP		( drop extra ASCII code )
      ;
      ::
        SEVENTEEN	( radians mode: flag -17 )
        ClrSysFlag	( not radians: clear system flag -17 )
        #47		( ASCII code for G is 71d (47h) )
        #=		( is it in grads mode? )
        ITE		( do next semi if true, or the next one if false )
        ::
          EIGHTEEN	( grads/degrees mode: flag -18 )
          SetSysFlag	( grads mode: set system flag -18 )
        ;
        ::
          EIGHTEEN	( grads/degrees mode: flag -18 )
          ClrSysFlag	( must be degrees mode: clear system flag -18 )
        ;
      ;
      TWELVE		( " T(3)A(R)F(.)" )
      SUB$1#		(             ^ to ASCII code )
      FORTYFOUR		( ASCII code for , is 44d )
      #=		( is the fraction mark a comma? )
      ITE		( do next semi if true, or the next one if false )
      ::
        FIFTYONE	( fraction mark: flag -51 )
        SetSysFlag	( fraction mark is comma: set system flag -51 )
      ;
      ::
        FIFTYONE	( fraction mark: flag -51 )
        ClrSysFlag	( fraction mark must be period: clear system flag -51 )
      ;
    ;
    KINVISLF		( translate, remove all CR's; we just need LF's )
    DROP		( drop empty string )
    SWAP		( get backup of system flags from level two )
    DOSTOSYSF		( restore system flags to previous settings )
    palparse		( get object from string, returns true or false )
    NOTcase2DROP	( if conversion fails drop two objects and quit )
    DUP			( duplicate object/composite )
    CARCOMP		( return first object of the composite )
    ' xSILENT'		( put object xSILENT' on the stack )
    EQ			( compare them )
    NOT?SEMI		( if false skip to end of secondary... )
    TWO			( get 2nd... )
    NTHCOMPDROP		( ...object behind the xSILENT' )
  ;
  ZERO			( ...check if it's not a string [actually, anything] )
  ::
    EDITDECOMP$		( make into string )
    KVISLF		( translations, add a CR to each LF for Windows/DOS )
    "%%HP: T("		( Kermit pre-header )
    GetIOPAR		( put IOPAR on 6 levels of stack, TRANSIO mode is in level 1 )
    6UNROLL 5DROP	( don't need upper 5 levels, so just keep level 1 )
    IOCheckReal %IP>#	( make sure it's valid and convert to bint )
    DUP FOUR #<		( make sure TRANSIO mode is less than four )
    ?SKIP		( don't error if mode is less than four )
    SetIOPARErr		( error if mode is not less than four )
    #>$			( convert bint to string )
    !append$		( combine TRANSIO string with existing header string )
    ")A("		( string between TRANSIO mode and angle mode )
    !append$		( combine strings )
    SEVENTEEN		( radians mode is system flag -17 )
    TestSysFlag		( check for radians mode )
    ITE
    CHR_R		( character R if radians mode )
    ::
      EIGHTEEN		( degrees/grads mode is system flag -18 )
      TestSysFlag	( check for grads mode )
      ITE		( do next object if true, otherwise the next one )
      CHR_G		( character G if grad mode )
      CHR_D		( character D otherwise )
    ;
    CHR>$		( convert character to string )
    !append$		( combine angle mode string with header string )
    FIFTYONE		( fraction mark: system flag -51 )
    TestSysFlag		( check for fraction mark as comma )
    ITE
    ")F(,)"		( fraction mark is comma )
    ")F(.)"		( otherwise, fraction mark must be period )
    !append$		( combine strings )
    ";\0D\0A"		( semicolon, CR, LF )
    !append$SWAP  	( combine strings, swap )
    !append$		( combine strings )
  ;
;
