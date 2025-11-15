*imports data;
PROC IMPORT OUT=Work.all1
DATAFILE= "D:\David\Lu\Learning Styles and Metacog\Study 2\Data\All Data 5-22-25 coded.xlsx"
DBMS=XLSX REPLACE; getnames=yes;
proc print;
run;


data all1; set all1;
*Fix Q85;
*uni = "YSU";
if Q85  = "Definitely false" then Q85_1 = 1;
if Q85  = "Probably false" then Q85_1 = 2;
if Q85  = "Neither true nor false" then Q85_1 = 3;
if Q85  = "Probably true" then Q85_1 = 4;
if Q85  = "Definitely true" then Q85_1 = 5;
if id = 0 then delete;
run;

*Need to score other LS measures. Need to run models with each. Run CFA to see if these measures fit a factor structure.;
data FullData; set all1;
if VSAR_verbal = "Very Low" then VSARVerbal = 0;
if VSAR_verbal = "Somewhat High" then VSARVerbal = 1;
if VSAR_verbal = "Average" then VSARVerbal = 2;
if VSAR_verbal = "Somewhat Low" then VSARVerbal = 3;
if VSAR_verbal = "Very High" then VSARVerbal = 4;

if VSAR_Spatial = "Very Low" then VSARSpatial = 0;
if VSAR_Spatial = "Somewhat High" then VSARSpatial = 1;
if VSAR_Spatial = "Average" then VSARSpatial = 2;
if VSAR_Spatial = "Somewhat Low" then VSARSpatial = 3;
if VSAR_Spatial = "Very High" then VSARSpatial = 4;

VSAR = VSARSpatial - VSARVerbal; *higher = more spatial;

LSQ = 0;
if LSQ_1 = "A labeled diagram showing each part" then LSQ = LSQ + 1; *Higher = more spatial;
if LSQ_2 = "A series of labeled diagrams showing the status of each part of the pump when you pull up on the handle and when you push down on the handle" then LSQ = LSQ + 1;
if LSQ_3 = "A map showing the roads and buildings along with a line from the starting point to the stopping point" then LSQ = LSQ +1;
if LSQ_4 = "A labeled diagram showing the steps" then LSQ = LSQ +1;
if LSQ_5 = "A line graph with one line showing the scores for boys and another line showing the scores for girls" then LSQ = LSQ +1;

if VVLSR_Question__1 = "Strongly more visual than verbal" then VVLSR = 6;
if VVLSR_Question__1 = "Moderately more visual than verbal" then VVLSR = 5;
if VVLSR_Question__1 = "Slightly more visual than verba" then VVLSR = 4;
if VVLSR_Question__1 = "Equally verbal and visual" then VVLSR = 3;
if VVLSR_Question__1 = "Slightly more verbal than visual" then VVLSR = 2;
if VVLSR_Question__1 = "Moderately more verbal than visual" then VVLSR = 1;
if VVLSR_Question__1 = "Strongly more verbal than visual" then VVLSR = 0;

BAML = 0;
if BAML_1 = "A series of diagrams" then BAML = BAML + 4;
if BAML_1 = "Mostly diagrams with little text" then BAML = BAML + 3;
if BAML_1 = "About equal parts text and diagrams" then BAML = BAML + 2;
if BAML_1 = "Mostly text with a few diagrams" then BAML = BAML + 1;
if BAML_1 = "Just text" then BAML = BAML + 0;

if BAML_2 = "A textbook chapter with diagrams (i.e., text with diagrams)" then BAML = BAML + 4;
if BAML_2 = "A textbook chapter without diagrams (i.e., just text)" then BAML = BAML + 0;

if BAML_3 = "The sections with diagrams (i.e., text with diagrams)" then BAML = BAML + 4;
if BAML_3 = "The sections without diagrams (i.e., just text)" then BAML = BAML + 0;

SBCSQ = 0;
if SBCSQ_Table__1 = "Strongly Agree" then SBCSQ = SBCSQ + 6;
if SBCSQ_Table__1 = "Moderately Agree" then SBCSQ = SBCSQ + 5;
if SBCSQ_Table__1 = "Slightly Agree" then SBCSQ = SBCSQ + 4;
if SBCSQ_Table__1 = "Niether Agree or Disagree" then SBCSQ = SBCSQ + 3;
if SBCSQ_Table__1 = "Slightly Disagree" then SBCSQ = SBCSQ + 2;
if SBCSQ_Table__1 = "Moderately Disagree" then SBCSQ = SBCSQ + 1;
if SBCSQ_Table__1 = "Strongly Disagree" then SBCSQ = SBCSQ + 0;

if SBCSQ_Table__2 = "Strongly Agree" then SBCSQ = SBCSQ + 0;
if SBCSQ_Table__2 = "Moderately Agree" then SBCSQ = SBCSQ + 1;
if SBCSQ_Table__2 = "Slightly Agree" then SBCSQ = SBCSQ + 2;
if SBCSQ_Table__2 = "Niether Agree or Disagree" then SBCSQ = SBCSQ + 3;
if SBCSQ_Table__2 = "Slightly Disagree" then SBCSQ = SBCSQ + 4;
if SBCSQ_Table__2 = "Moderately Disagree" then SBCSQ = SBCSQ + 5;
if SBCSQ_Table__2 = "Strongly Disagree" then SBCSQ = SBCSQ + 6;

if SBCSQ_Table__3 = "Strongly Agree" then SBCSQ = SBCSQ + 6;
if SBCSQ_Table__3 = "Moderately Agree" then SBCSQ = SBCSQ + 5;
if SBCSQ_Table__3 = "Slightly Agree" then SBCSQ = SBCSQ + 4;
if SBCSQ_Table__3 = "Niether Agree or Disagree" then SBCSQ = SBCSQ + 3;
if SBCSQ_Table__3 = "Slightly Disagree" then SBCSQ = SBCSQ + 2;
if SBCSQ_Table__3 = "Moderately Disagree" then SBCSQ = SBCSQ + 1;
if SBCSQ_Table__3 = "Strongly Disagree" then SBCSQ = SBCSQ + 0;

if SBCSQ_Table__4 = "Strongly Agree" then SBCSQ = SBCSQ + 0;
if SBCSQ_Table__4 = "Moderately Agree" then SBCSQ = SBCSQ + 1;
if SBCSQ_Table__4 = "Slightly Agree" then SBCSQ = SBCSQ + 2;
if SBCSQ_Table__4 = "Niether Agree or Disagree" then SBCSQ = SBCSQ + 3;
if SBCSQ_Table__4 = "Slightly Disagree" then SBCSQ = SBCSQ + 4;
if SBCSQ_Table__4 = "Moderately Disagree" then SBCSQ = SBCSQ + 5;
if SBCSQ_Table__4 = "Strongly Disagree" then SBCSQ = SBCSQ + 6;

if SBCSQ_Table__5 = "Strongly Agree" then SBCSQ = SBCSQ + 6;
if SBCSQ_Table__5 = "Moderately Agree" then SBCSQ = SBCSQ + 5;
if SBCSQ_Table__5 = "Slightly Agree" then SBCSQ = SBCSQ + 4;
if SBCSQ_Table__5 = "Niether Agree or Disagree" then SBCSQ = SBCSQ + 3;
if SBCSQ_Table__5 = "Slightly Disagree" then SBCSQ = SBCSQ + 2;
if SBCSQ_Table__5 = "Moderately Disagree" then SBCSQ = SBCSQ + 1;
if SBCSQ_Table__5 = "Strongly Disagree" then SBCSQ = SBCSQ + 0;

if SBCSQ_Table__6 = "Strongly Agree" then SBCSQ = SBCSQ + 0;
if SBCSQ_Table__6 = "Moderately Agree" then SBCSQ = SBCSQ + 1;
if SBCSQ_Table__6 = "Slightly Agree" then SBCSQ = SBCSQ + 2;
if SBCSQ_Table__6 = "Niether Agree or Disagree" then SBCSQ = SBCSQ + 3;
if SBCSQ_Table__6 = "Slightly Disagree" then SBCSQ = SBCSQ + 4;
if SBCSQ_Table__6 = "Moderately Disagree" then SBCSQ = SBCSQ + 5;
if SBCSQ_Table__6 = "Strongly Disagree" then SBCSQ = SBCSQ + 6;


if Q29_1 = "Strongly disagree" then Attention = 1;
if Q29_1 = "Disagree" then Attention = 2;
if Q29_1 = "Somewhat disagree" then Attention = 3;
if Q29_1 = "Neither agree nor disagree" then Attention = 4;
if Q29_1 = "Somewhat agree" then Attention = 5;
if Q29_1 = "Agree" then Attention = 6;
if Q29_1 = "Strongly agree" then Attention = 7;

if Q29_2 = "Strongly disagree" then MindWandering = 1;
if Q29_2 = "Disagree" then MindWandering = 2;
if Q29_2 = "Somewhat disagree" then MindWandering = 3;
if Q29_2 = "Neither agree nor disagree" then MindWandering = 4;
if Q29_2 = "Somewhat agree" then MindWandering = 5;
if Q29_2 = "Agree" then MindWandering = 6;
if Q29_2 = "Strongly agree" then MindWandering = 7;

if Q29_3 = "Strongly disagree" then NoMultitasking = 1;
if Q29_3 = "Disagree" then NoMultitasking = 2;
if Q29_3 = "Somewhat disagree" then NoMultitasking = 3;
if Q29_3 = "Neither agree nor disagree" then NoMultitasking = 4;
if Q29_3 = "Somewhat agree" then NoMultitasking = 5;
if Q29_3 = "Agree" then NoMultitasking = 6;
if Q29_3 = "Strongly agree" then NoMultitasking = 7;


Consent = Q122;
Race = Q60;
Gender = Q56;
MetacogAccOutOfTen = Q30;
MetaCogHowLongToStudy = Q31_1;

*Code prior exposure;
if Q63 = "Yes" then PriorExposureLearning = 1;
if Q63 = "No" then PriorExposureLearning = 0;
if Q65 = "Yes" then PriorExposureContiguity = 1;
if Q65 = "No" then PriorExposureContiguity = 0;


*Fix Q85;
if Q85  = "Definitely false" then Q85_1 = 1;
if Q85  = "Probably false" then Q85_1 = 2;
if Q85  = "Neither true nor false" then Q85_1 = 3;
if Q85  = "Probably true" then Q85_1 = 4;
if Q85  = "Definitely true" then Q85_1 = 5;

*Code condition;
if Q46 = "Yes, I'm ready." then Cond = "Conceptual";
if Q46 = "No, I'm NOT ready." then Cond = "Conceptual";
if Q44 = "Yes, I'm ready." then Cond = "Text";
if Q44 = "No, I'm NOT ready." then Cond = "Text";
if Q48 = "Yes, I'm ready." then Cond = "Image";
if Q48 = "No, I'm NOT ready." then Cond = "Image";

*Score Quiz;
TotalCompQuestionScore = 0;
if Q33_1 = "Gutherie" then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q51 = "changes the context" then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q34 = "Take the dog in the house immediately before he finishes barking" then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q35_1 = "the behavior being punished is aggression or fear." then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q36 = "Pee." then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q37_1 = "We may need practice to ensure that we do not forget what we learned." then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q38 = "The dogâ€™s natural response to the punishment is consistent with the behavior being punished." then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q39_1 = "A child takes a chocolate bar from the Halloween candy basket as soon as he organizes his toys." then TotalCompQuestionScore = TotalCompQuestionScore + 1; 
if Q40 = "Study." then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q41_1 = "Let her watch her anime in her favorite chair." then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q42 = "Threshold method." then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q44_1 = "Incompatible method." then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q45 = "Go to Yellowstone National Park next summer if she sticks to her workout all year." then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q46_1 = "Ask the husband to put the coat on, go to the vegetable garden, return to the house and hang up the coat when returning." then TotalCompQuestionScore = TotalCompQuestionScore + 1;
*if Q47 = "unconditioned stimulus." then TotalCompQuestionScore = TotalCompQuestionScore + 1;
*if Q48_1 = "classical" then TotalCompQuestionScore = TotalCompQuestionScore + 1;
if Q49 = "Positive reinforcement" then TotalCompQuestionScore = TotalCompQuestionScore + 1;

*Score OSIVQ;
objTotal = Q13 + Q25 + Q27 + Q29 + Q33 + Q39 + Q43 + Q71 + Q77 + Q83 + Q91 + Q93 + Q105 + Q109 + Q113;
SpTotal  = Q3 + Q7 + Q11 + Q17 + Q23 + Q31 + Q37 + Q75 + Q79 + Q85_1 + Q87 + Q89 + Q101 - Q107 + Q111;
VerbTotal = 0 -Q5 + Q9 + Q19 - Q21 + Q35 + Q67 + Q69 + Q73 + Q81 + Q95 + Q97 + Q99 + Q103 - Q106;

if ObjTotal = . then delete;
if SpTotal = . then delete;
if VerbTotal= . then delete;
*Get catch question failures;
Keep = 1;
if Q33_1 ne "Gutherie" then Keep = 0;
if Q33_1 = "" then Keep = 2;
if cond = "" then delete;
dumb=1;
TotalCompQuestionScore = TotalCompQuestionScore/18;
if TotalCompQuestionScore <= .11661 then delete;
if keep ne 1 then delete;
keep ID uni Cond objTotal SpTotal VerbTotal MetacogAccOutOfTen MetaCogHowLongToStudy TotalCompQuestionScore VSAR LSQ SBCSQ BAML VVLSR
Attention MindWandering Nomultitasking consent Race Gender PriorExposureLearning PriorExposureContiguity Keep ResponseID dumb;
proc print;
run;

PROC Export data=FullData
	outfile="D:\David\Lu\Learning Styles and Metacog\Study 2\Data\FinalData 5-22-2025 final.xlsx"
	DBMS=XLSX REPLACE; run; 

Proc summary data=FullData; Class keep;
Var dumb;
output out=GroupAvg sum=dumb;
proc print;
run;

Proc summary data=FullData; Class Cond;
Var TotalCompQuestionScore MetacogAccOutOfTen MetaCogHowLongToStudy;
output out=GroupAvg mean=TotalCompQuestionScore MetacogAccOutOfTen MetaCogHowLongToStudy stderr=TotalCompQuestionScoreSE MetacogAccOutOfTenSE MetaCogHowLongToStudySE;
proc print;
run;


*T-tests; *Prior exposure to learning or Guthrie in particular affect emtacog, but not accuracy or study time;
proc ttest data=FullData;
class PriorExposureLearning;
var TotalCompQuestionScore MetacogAccOutOfTen MetaCogHowLongToStudy;
run;

proc ttest data=FullData;
class PriorExposureContiguity;
var TotalCompQuestionScore MetacogAccOutOfTen MetaCogHowLongToStudy;
run;


Proc summary data=FullData; Class Cond;
Var MetacogAccOutOfTen MetaCogHowLongToStudy TotalCompQuestionScore; 
output out=GroupAvg mean=MetacogAccOutOfTen MetaCogHowLongToStudy TotalCompQuestionScore stderr=MetacogAccOutOfTenSE MetaCogHowLongToStudySE TotalCompQuestionScoreSE;
proc print;
run;

PROC Export data=GroupAvg
	outfile="C:\Users\frankdavid\Desktop\David\Schwab Learning Styles and Metacog\Data\MEans.xlsx"
	DBMS=XLSX REPLACE; run; 

proc sort data=Fulldata; by cond;
run;

  proc plot data=FullData;
      plot TotalCompQuestionScore * objTotal = '+' /; by cond;
   run;

  proc plot data=FullData;
      plot MetaCogHowLongToStudy * SpTotal = '+' /; by cond;
   run;
/*
PROC Export data=FullData
	outfile="C:\Users\frankdavid\Desktop\David\Schwab Learning Styles and Metacog\Data\Combined pool and extra credit.xlsx"
	DBMS=XLSX REPLACE; run; 
*/

*Get means for centering;
Proc summary data=FullData nway; Class dumb;
Var objTotal SpTotal VerbTotal TotalCompQuestionScore VSAR LSQ SBCSQ BAML VVLSR; 
output out=FullMeans mean=MobjTotal MSpTotal MVerbTotal MTotalCompQuestionScore mVSAR mLSQ mSBCSQ mBAML mVVLSR std=SDobjTotal SDSpTotal SDVerbTotal SDTotalCompQuestionScore VSARsd LSQsd SBCSQsd BAMLsd VVLSRsd;
proc print;
run;

Data FullCentered; merge FullData FullMeans; by dumb;
ObjCen = OBjTotal-MObjTotal;
SpCen = SpTotal-MSpTotal;
VerbCen = VerbTotal-MVerbTotal;

ObjCenter = ObjCen/SDobjTotal;
SpCenter = SpCen/SDSpTotal;
VerbCenter = VerbCen/SDVerbTotal;

CompCent = TotalCompQuestionScore-MTotalCompQuestionScore;
CompCenter = CompCent/SDTotalCompQuestionScore;

cVSAR = VSAR-mVSAR;
cLSQ = LSQ-mLSQ;
cSBCSQ = SBCSQ-mSBCSQ;
cBAML = BAML-mBAML;
cVVLSR = VVLSR -mVVLSR;

cVSAR = cVSAR/VSARsd;
cLSQ = cLSQ/LSQsd;
cSBCSQ = cSBCSQ/SBCSQsd;
cBAML = cBAML/BAMLsd;
cVVLSR = cVVLSR/VVLSRsd;

flag = 0;
if CompCenter < -2.5 then flag = 1;
dumb = 1;
*if flag = 1 then delete;

keep uni ID Cond objTotal SpTotal VerbTotal MetacogAccOutOfTen MetaCogHowLongToStudy TotalCompQuestionScore MTotalCompQuestionScore SDTotalCompQuestionScore CompCenter ObjCen SpCen VerbCen cVSAR cLSQ cSBCSQ cBAML cVVLSR 
Attention MindWandering Nomultitasking consent Race Gender PriorExposureLearning PriorExposureContiguity Keep ResponseID ObjCenter spCenter VerbCenter MobjTotal MSpTotal MVerbTotal SDobjTotal SDSpTotal SDVerbTotal flag dumb;
proc print; run;
*1 person more than 2.5 SD below mean;


Proc summary data=FullCentered; Class keep uni;
Var dumb;
output out=GroupAvg sum=dumb;
proc print;
run;

PROC GLM DATA=FullCentered; CLASS cond;
MODEL TotalCompQuestionScore=Cond / SOLUTION;
RUN;

title"Comp score"; *Nothing;
PROC GLM DATA=FullCentered; CLASS cond;
MODEL TotalCompQuestionScore=Cond objCenter SpCenter VerbCenter Cond*objCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL TotalCompQuestionScore=Cond|cLSQ / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL TotalCompQuestionScore=Cond|cVSAR / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL TotalCompQuestionScore=Cond|cSBCSQ / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL TotalCompQuestionScore=Cond|cBAML / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL TotalCompQuestionScore=Cond|cVVLSR / SOLUTION;
RUN;


title"MetacogAccOutOfTen";
PROC GLM DATA=FullCentered; CLASS cond; *Spatial and verbal people think they will do better overall, buit spatial people think they'll do WORSE in conceptual;
MODEL MetacogAccOutOfTen=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL MetacogAccOutOfTen=Cond|cLSQ / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL MetacogAccOutOfTen=Cond|cVSAR / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL MetacogAccOutOfTen=Cond|cSBCSQ / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL MetacogAccOutOfTen=Cond|cBAML / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL MetacogAccOutOfTen=Cond|cVVLSR / SOLUTION;
RUN;

/*
PROC GLM DATA=TwoCond; CLASS cond;
MODEL MetacogAccOutOfTen=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;
MODEL MetacogAccOutOfTen=Cond ObjCenter SpCenter VerbCenter MindWandering Cond*ObjCenter Cond*SpCenter Cond*VerbCenter cond*MindWandering / SOLUTION;
RUN;

*/

title"Study Time";
PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL MetaCogHowLongToStudy=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
RUN;


PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL MetaCogHowLongToStudy=Cond|cLSQ / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL MetaCogHowLongToStudy=Cond|cVSAR / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL MetaCogHowLongToStudy=Cond|cSBCSQ / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL MetaCogHowLongToStudy=Cond|cBAML / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;*Nothing;
MODEL MetaCogHowLongToStudy=Cond|cVVLSR / SOLUTION;
RUN;


proc corr data=FullCentered alpha;
var  objTotal SpTotal VerbTotal MetacogAccOutOfTen MetaCogHowLongToStudy TotalCompQuestionScore MTotalCompQuestionScore SDTotalCompQuestionScore CompCenter ObjCen SpCen VerbCen cVSAR cLSQ cSBCSQ cBAML cVVLSR;
run;
*Correlations make sense but are weak .40 or less, most less than .20;



Data Combo; set FullCentered;
Spatial = (cVSAR + cLSQ + cSBCSQ + cVVLSR)/4;
run;

Title "Comp score";
PROC GLM DATA=Combo; CLASS cond;*Nothing;
MODEL MetacogAccOutOfTen=Cond|Spatial / SOLUTION;
RUN;

Title"Metacog";
PROC GLM DATA=Combo; CLASS cond;*Nothing;
MODEL MetacogAccOutOfTen=Cond|Spatial / SOLUTION;
RUN;

title"Study Time";
PROC GLM DATA=Combo; CLASS cond;*Nothing;
MODEL MetaCogHowLongToStudy=Cond|Spatial / SOLUTION;
RUN;


/*
proc calis data=FullCentered;
   factor
      verbal ---> cVSAR cLSQ cSBCSQ cVVLSR,
	  Spatial ---> objTotal SpTotal;
   pvar
      verbal = 1,
	  Spatial = 1;
  fitindex noindextype on(only)=[chisq df probchi rmsea srmsr bentlercfi gfi];
run;



proc calis data=FullCentered;
   factor
      verbal ---> cVSAR cLSQ cSBCSQ cVVLSR ObjCen SpCen VerbCen;
   pvar
      verbal = 1;
   fitindex noindextype on(only)=[chisq df probchi rmsea srmsr bentlercfi];
run;
*/


proc calis data=FullCentered;
   factor
      Spatial ---> cVSAR cLSQ cSBCSQ cVVLSR;
   pvar
      Spatial = 1;
   fitindex noindextype on(only)=[chisq df probchi rmsea srmsr bentlercfi];
run;























/*
objTotal = Q13 + Q25 + Q27 + Q29 + Q33 + Q39 + Q43 + Q71 + Q77 + Q83 + Q91 + Q93 + Q105 + Q109 + Q113;
SpTotal  = Q3 + Q7 + Q11 + Q17 + Q23 + Q31 + Q37 + Q75 + Q79 + Q85_1 + Q87 + Q89 + Q101 - Q107 + Q111;
VerbTotal = 0 -Q5 + Q9 + Q19 - Q21 + Q35 + Q67 + Q69 + Q73 + Q81 + Q95 + Q97 + Q99 + Q103 - Q106;
*/
Title"Exploratory Factor Analysis";
proc factor data = all1 nfactors = 3 corr scree ev rotate = varimax method = prinit priors = smc;
var Q13  Q25  Q27  Q29  Q33  Q39  Q43  Q71  Q77  Q83  Q91  Q93  Q105  Q109  Q113 Q3  Q7  Q11  Q17  Q23  Q31  Q37  Q75  Q79  Q85_1  Q87  Q89  Q101  Q107  Q111 Q5  Q9  Q19  Q21  Q35  Q67  Q69  Q73  Q81  Q95  Q97  Q99  Q103  Q106;
run;

Title"Confirmatory Factor Analysis";
proc calis data=all1;
   factor
      Obj ===> Q13  Q25  Q27  Q29  Q33  Q39  Q43  Q71  Q77  Q83  Q91  Q93  Q105  Q109  Q113 = load1 load1 load1 load1 load1 load1 load1 load1 load1 load1 load1 load1 load1 load1 load1,
      Sp ===> Q3  Q7  Q11  Q17  Q23  Q31  Q37  Q75  Q79  Q85_1  Q87  Q89  Q101 Q107  Q111   = load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2,
	  Verb ===> Q5  Q9  Q19  Q21  Q35  Q67  Q69  Q73  Q81  Q95  Q97  Q99  Q103  Q106 = load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2;
   pvar
      Obj = 1.,
      Sp = 1.,
	  Verb = 1.,
      Q13  Q25  Q27  Q29  Q33  Q39  Q43  Q71  Q77  Q83  Q91  Q93  Q105  Q109  Q113 = 15*evar1,
      Q3  Q7  Q11  Q17  Q23  Q31  Q37  Q75  Q79  Q85_1  Q87  Q89  Q101 Q107  Q111  = 15*evar2,
	  Q5  Q9  Q19  Q21  Q35  Q67  Q69  Q73  Q81  Q95  Q97  Q99  Q103  Q106  = 14*evar2;
run;
*I am not sure any of this is done right. All loadings are constrained to be identical. I don't think I want that. The model doesn't fit worth a damn.;

Title"Chronbach's alpha Obj";
proc corr data=FullData alpha nomiss;
var  Q13  Q25  Q27  Q29  Q33  Q39  Q43  Q71  Q77  Q83  Q91  Q93  Q105  Q109  Q113;
run;

Title"Chronbach's alpha Sp";
proc corr data=FullData alpha nomiss;
var  Q3  Q7  Q11  Q17  Q23  Q31  Q37  Q75  Q79  Q85_1  Q87  Q89  Q101 Q107  Q111;
run;

Title"Chronbach's alpha Verb";
proc corr data=FullData alpha nomiss;
var  Q5  Q9  Q19  Q21  Q35  Q67  Q69  Q73  Q81  Q95  Q97  Q99  Q103  Q106;
run;


/*

title 'Violin Plots'; <==does not work. 
proc sgpanel data=FullData nocycleattrs;
  panelby Cond / layout=columnlattice onepanel
    novarname noborder colheaderpos=bottom;
  band y=MetacogAccOutOfTen upper=density lower=mirror / fill outline;
  rowaxis label='MetacogOutofTen' grid;
  colaxis display=none;
run;
*/


symbol color = salmon h = .8;
goptions ftext=swiss;
axis1 minor=none color=black label=(angle=90 rotate=0);
title ’Box Plots’;
proc boxplot data=FullData;
plot MetacogAccOutOfTen*cond/ cframe = vligb
cboxes = dagr
cboxfill = ywh
vaxis = axis1;
run;

proc boxplot data=FullData;
plot MetaCogHowLongToStudy*cond/ cframe = vligb
cboxes = dagr
cboxfill = ywh
vaxis = axis1;
run;

proc boxplot data=FullData;
plot TotalCompQuestionScore*cond/ cframe = vligb
cboxes = dagr
cboxfill = ywh
vaxis = axis1;
run;

/*
title"Comp score centered only";
PROC GLM DATA=FullCentered; CLASS cond;
MODEL TotalCompQuestionScore=Cond objCen SpCen VerbCen Cond*objCen Cond*SpCen Cond*VerbCen / SOLUTION;
RUN;

title"Comp score all centered";
PROC GLM DATA=FullCentered; CLASS cond;
MODEL CompCenter=Cond objCenter SpCenter VerbCenter Cond*objCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
RUN;

title"Comp score No center";
PROC GLM DATA=FullData; CLASS cond;
MODEL TotalCompQuestionScore=Cond objTotal SpTotal VerbTotal Cond*objTotal Cond*SpTotal Cond*VerbTotal / SOLUTION;
RUN;

title"Comp score No center";
PROC GLM DATA=FullCentered; CLASS cond;
MODEL TotalCompQuestionScore=Cond objTotal SpTotal VerbTotal Cond*objTotal Cond*SpTotal Cond*VerbTotal / SOLUTION;
RUN;

title"Comp score Main effects only";
PROC GLM DATA=FullCentered; CLASS cond;
MODEL TotalCompQuestionScore=Cond  / SOLUTION;
RUN;

Proc summary data=FullCentered nway; Class Cond;
Var TotalCompQuestionScore; 
output out=ScoreByCond mean=MTotalCompQuestionScore std=SDTotalCompQuestionScore;
proc print;
run;


Data TwoCond; set FullCentered;
if cond = "Image" then delete;
run;

PROC GLM DATA=TwoCond; CLASS cond;
MODEL TotalCompQuestionScore=Cond objCenter SpCenter VerbCenter Cond*objCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
RUN;


PROC GLM DATA=TwoCond; CLASS cond;
MODEL TotalCompQuestionScore=Cond  / SOLUTION;
RUN;

/*
PROC GLM DATA=FullCentered; CLASS cond;
MODEL totalCompQuestionScore=Cond objCenter SpCenter VerbCenter MindWandering Cond*objCenter Cond*SpCenter Cond*VerbCenter cond*MindWandering / SOLUTION;
RUN;
*/
*VSAR LSQ SBCSQ BAML VVLSR;


title"MetacogAccOutOfTen";
PROC GLM DATA=FullCentered; CLASS cond;
MODEL MetacogAccOutOfTen=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;
MODEL MetacogAccOutOfTen=Cond|cLSQ / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;
MODEL MetacogAccOutOfTen=Cond|cVSAR / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;
MODEL MetacogAccOutOfTen=Cond|cSBCSQ / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;
MODEL MetacogAccOutOfTen=Cond|cBAML / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;
MODEL MetacogAccOutOfTen=Cond|cVVLSR / SOLUTION;
RUN;

/*
PROC GLM DATA=TwoCond; CLASS cond;
MODEL MetacogAccOutOfTen=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;
MODEL MetacogAccOutOfTen=Cond ObjCenter SpCenter VerbCenter MindWandering Cond*ObjCenter Cond*SpCenter Cond*VerbCenter cond*MindWandering / SOLUTION;
RUN;

*/

title"Study Time";
PROC GLM DATA=FullCentered; CLASS cond;
MODEL MetaCogHowLongToStudy=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
RUN;
/*
PROC GLM DATA=TwoCond; CLASS cond;
MODEL MetaCogHowLongToStudy=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
RUN;

PROC GLM DATA=FullCentered; CLASS cond;
MODEL MetaCogHowLongToStudy=Cond ObjCenter SpCenter VerbCenter MindWandering Cond*ObjCenter Cond*SpCenter Cond*VerbCenter cond*MindWandering / SOLUTION;
RUN;
*/


Title"No Prior Exposure";
data NoPrior; set FullCentered;
if PriorExposureLearning = 1 then delete;
proc print; 
run;

	title2"Comp score centered";
	PROC GLM DATA=NoPrior; CLASS cond;
	MODEL TotalCompQuestionScore=Cond objCenter SpCenter VerbCenter Cond*objCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
	RUN;

	title2"NoPrior";
	PROC GLM DATA=FullCentered; CLASS cond;
	MODEL MetacogAccOutOfTen=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
	RUN;


	title2"NoPrior";
	PROC GLM DATA=FullCentered; CLASS cond;
	MODEL MetaCogHowLongToStudy=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
	RUN;


Title"Prior Exposure";
data Prior; set FullCentered;
if PriorExposureLearning = 0 then delete;
run;


	title2"Comp score centered";
	PROC GLM DATA=Prior; CLASS cond;
	MODEL TotalCompQuestionScore=Cond objCenter SpCenter VerbCenter Cond*objCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
	RUN;

	title2"MetacogAccOutOfTen";
	PROC GLM DATA=FullCentered; CLASS cond;
	MODEL MetacogAccOutOfTen=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter Attention MindWandering Nomultitasking PriorExposureLearning PriorExposureContiguity / SOLUTION;
	RUN;

		title2"MetacogAccOutOfTen";
	PROC GLM DATA=Prior; CLASS cond;
	MODEL MetacogAccOutOfTen=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter Attention MindWandering Nomultitasking PriorExposureLearning PriorExposureContiguity / SOLUTION;
	RUN;

	title2"Study Time";
	PROC GLM DATA=Prior; CLASS cond;
	MODEL MetaCogHowLongToStudy=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter / SOLUTION;
	RUN;



	title2"Comp score centered";
	PROC GLM DATA=FullCentered; CLASS cond PriorExposureLearning PriorExposureContiguity;
	MODEL TotalCompQuestionScore=Cond ObjCenter SpCenter VerbCenter Cond*ObjCenter Cond*SpCenter Cond*VerbCenter PriorExposureContiguity cond*PriorExposureContiguity / SOLUTION;
	RUN;

	




title"Comp score";
PROC GLM DATA=FullData; CLASS cond;
MODEL TotalCompQuestionScore=Cond objTotal SpTotal VerbTotal Cond*objTotal Cond*SpTotal Cond*VerbTotal / SOLUTION;
RUN;


Data TwoCond; set FullData;
if cond = "Image" then delete;
run;

PROC GLM DATA=TwoCond; CLASS cond;
MODEL TotalCompQuestionScore=Cond objTotal SpTotal VerbTotal Cond*objTotal Cond*SpTotal Cond*VerbTotal / SOLUTION;
RUN;


PROC GLM DATA=FullData; CLASS cond;
MODEL TotalCompQuestionScore=Cond  / SOLUTION;
RUN;

PROC GLM DATA=FullData; CLASS cond;
MODEL TotalCompQuestionScore=Cond objTotal SpTotal VerbTotal MindWandering Cond*objTotal Cond*SpTotal Cond*VerbTotal cond*MindWandering / SOLUTION;
RUN;

/*
TotalCompQuestionScore MetacogAccOutOfTen MetaCogHowLongToStudy
Attention MindWandering Nomultitasking PriorExposureLearning PriorExposureContiguity objCenter SpCenter VerbCenter
*/
PROC GLM DATA=FullData; CLASS cond;
MODEL MetacogAccOutOfTen=Cond Attention MindWandering Nomultitasking PriorExposureLearning PriorExposureContiguity objCenter SpCenter VerbCenter / SOLUTION;
RUN;
/*
	proc mixed data=FullData method=ml; class ResponseID Cond (ref="Conceptual");
	model TotalCompQuestionScore=Cond objTotal SpTotal VerbTotal Cond*objTotal Cond*SpTotal Cond*VerbTotal /s; 
	repeated /subject=ResponseID type=cs;
	run;

proc anova data=fulldata;
class cond;
model TotalCompQuestionScore=cond;
MEANS cond / tukey cldiff alpha=0.05;
run;
*/
/*
title"MetacogAccOutOfTen";
PROC GLM DATA=FullData; CLASS cond;
MODEL MetacogAccOutOfTen=Cond objTotal SpTotal VerbTotal Cond*objTotal Cond*SpTotal Cond*VerbTotal / SOLUTION;
RUN;

PROC GLM DATA=TwoCond; CLASS cond;
MODEL MetacogAccOutOfTen=Cond objTotal SpTotal VerbTotal Cond*objTotal Cond*SpTotal Cond*VerbTotal / SOLUTION;
RUN;

PROC GLM DATA=FullData; CLASS cond;
MODEL MetacogAccOutOfTen=Cond objTotal SpTotal VerbTotal MindWandering Cond*objTotal Cond*SpTotal Cond*VerbTotal cond*MindWandering / SOLUTION;
RUN;


/*
	proc mixed data=FullData method=ml; class ResponseID Cond (ref="Text");
	model MetacogAccOutOfTen=Cond objTotal SpTotal VerbTotal Cond*objTotal Cond*SpTotal Cond*VerbTotal /s; 
	repeated /subject=ResponseID type=cs;
	run;
*/
/*
title"Study Time";
PROC GLM DATA=FullData; CLASS cond;
MODEL MetaCogHowLongToStudy=Cond objTotal SpTotal VerbTotal Cond*objTotal Cond*SpTotal Cond*VerbTotal / SOLUTION;
RUN;

PROC GLM DATA=TwoCond; CLASS cond;
MODEL MetaCogHowLongToStudy=Cond objTotal SpTotal VerbTotal Cond*objTotal Cond*SpTotal Cond*VerbTotal / SOLUTION;
RUN;

PROC GLM DATA=FullData; CLASS cond;
MODEL MetaCogHowLongToStudy=Cond objTotal SpTotal VerbTotal MindWandering Cond*objTotal Cond*SpTotal Cond*VerbTotal cond*MindWandering / SOLUTION;
RUN;

/*
	proc mixed data=FullData method=ml; class ResponseID Cond (ref="Text");
	model MetaCogHowLongToStudy=Cond objTotal SpTotal VerbTotal Cond*objTotal Cond*SpTotal Cond*VerbTotal /s; 
	repeated /subject=ResponseID type=cs;
	run;
*/

proc corr data=FullCentered  OUTP=pearson_corr; var TotalCompQuestionScore MetacogAccOutOfTen MetaCogHowLongToStudy
Attention MindWandering Nomultitasking PriorExposureLearning PriorExposureContiguity objCenter SpCenter VerbCenter ;
run;

	PROC Export data=pearson_corr
	outfile="D:\David\Learning Styles and Metacog\Corr matrix.xlsx"
	DBMS=XLSX REPLACE; run; 

proc corr data=FullCentered; var TotalCompQuestionScore MetacogAccOutOfTen MetaCogHowLongToStudy
Attention MindWandering Nomultitasking PriorExposureLearning PriorExposureContiguity objCenter SpCenter VerbCenter;
run;

  proc plot data=FullData;
      plot TotalCompQuestionScore * MindWandering = '+' /;
   run;


	PROC Export data=FullData
	outfile="C:\Users\frankdavid\Desktop\David\Schwab Learning Styles and Metacog\Data\Reduced1.xlsx"
	DBMS=XLSX REPLACE; run; 


PROC GLM DATA=FullData; CLASS cond;
MODEL NoMultitasking=Cond objTotal SpTotal VerbTotal Cond*objTotal Cond*SpTotal Cond*VerbTotal / SOLUTION;
RUN;

*DO NOT USE, CELLS WITH N = 1;
/*-------------------------------------------------------------------------------------------------------------------

Title"Exploratory Factor Analysis";
proc factor data = Fulldata nfactors = 3 corr scree ev rotate = varimax method = prinit priors = smc;
var Q13  Q25  Q27  Q29  Q33  Q39  Q43  Q71  Q77  Q83  Q91  Q93  Q105  Q109  Q113 Q3  Q7  Q11  Q17  Q23  Q31  Q37  Q75  Q79  Q85_1  Q87  Q89  Q101  Q107  Q111 Q5  Q9  Q19  Q21  Q35  Q67  Q69  Q73  Q81  Q95  Q97  Q99  Q103  Q106;
run;

Title"Confirmatory Factor Analysis";
proc calis data=Fulldata;
   factor
      Obj ===> Q13  Q25  Q27  Q29  Q33  Q39  Q43  Q71  Q77  Q83  Q91  Q93  Q105  Q109  Q113 = load1 load1 load1 load1 load1 load1 load1 load1 load1 load1 load1 load1 load1 load1 load1,
      Sp ===> Q3  Q7  Q11  Q17  Q23  Q31  Q37  Q75  Q79  Q85_1  Q87  Q89  Q101 Q107  Q111   = load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2,
	  Verb ===> Q5  Q9  Q19  Q21  Q35  Q67  Q69  Q73  Q81  Q95  Q97  Q99  Q103  Q106 = load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2 load2;
   pvar
      Obj = 1.,
      Sp = 1.,
	  Verb = 1.,
      Q13  Q25  Q27  Q29  Q33  Q39  Q43  Q71  Q77  Q83  Q91  Q93  Q105  Q109  Q113 = 15*evar1,
      Q3  Q7  Q11  Q17  Q23  Q31  Q37  Q75  Q79  Q85_1  Q87  Q89  Q101 Q107  Q111  = 15*evar2,
	  Q5  Q9  Q19  Q21  Q35  Q67  Q69  Q73  Q81  Q95  Q97  Q99  Q103  Q106  = 14*evar2;
run;
*I am not sure any of this is done right. All loadings are constrained to be identical. I don't think I want that. The model doesn't fit worth a damn.;

Title"Chronbach's alpha Obj";
proc corr data=FullData alpha nomiss;
var  Q13  Q25  Q27  Q29  Q33  Q39  Q43  Q71  Q77  Q83  Q91  Q93  Q105  Q109  Q113;
run;

Title"Chronbach's alpha Sp";
proc corr data=FullData alpha nomiss;
var  Q3  Q7  Q11  Q17  Q23  Q31  Q37  Q75  Q79  Q85_1  Q87  Q89  Q101 Q107  Q111;
run;

Title"Chronbach's alpha Verb";
proc corr data=FullData alpha nomiss;
var  Q5  Q9  Q19  Q21  Q35  Q67  Q69  Q73  Q81  Q95  Q97  Q99  Q103  Q106;
run;










	*imports data;
PROC IMPORT OUT=Work.all2
DATAFILE= "C:\Users\frankdavid\Desktop\David\Schwab Learning Styles and Metacog\Data\10 27 2021 FinalOutput5SDAndMeanWithMedSplit obj Sp Verb LSV Pool_October 6, 2021_10.48.sav Obj Total Ver.sav"
replace;
proc print;
run;

	PROC Export data=all2
	outfile="C:\Users\frankdavid\Desktop\David\Schwab Learning Styles and Metacog\Data\Schwab all2.xlsx"
	DBMS=XLSX REPLACE; run; 

PROC IMPORT OUT=Work.all2
DATAFILE= "C:\Users\frankdavid\Desktop\David\Schwab Learning Styles and Metacog\Data\Schwab all2.xlsx"
DBMS=XLSX REPLACE; getnames=yes;
proc print;
run;

data include2; set all2;
if inclusion = 0 then delete;
MetacogAccOutOfTen = Q30;
MetaCogHowLongToStudy = Q31_0;
keep Condition objTotal SpTotal VerbTotal MetacogAccOutOfTen MetaCogHowLongToStudy TotalCompQuestionScore ObjHL SpHL VerbHL;
proc print;
run;

PROC glm DATA=include2;
CLASS Condition ObjHL SpHL VerbHL;
MODEL TotalCompQuestionScore=Condition ObjHL SpHL VerbHL Condition*objHL Condition*SpHL Condition*VerbHL;
MEANS Condition ObjHL SpHL VerbHL / tukey cldiff alpha=0.05;
RUN; 


PROC glm DATA=include2;
CLASS Condition ObjHL SpHL VerbHL;
MODEL MetacogAccOutOfTen=Condition ObjHL SpHL VerbHL Condition*objHL Condition*SpHL Condition*VerbHL;
MEANS Condition ObjHL SpHL VerbHL / tukey cldiff alpha=0.05;
RUN; 

PROC glm DATA=include2;
CLASS Condition ObjHL SpHL VerbHL;
MODEL MetaCogHowLongToStudy=Condition ObjHL SpHL VerbHL Condition*objHL Condition*SpHL Condition*VerbHL;
MEANS Condition ObjHL SpHL VerbHL / tukey cldiff alpha=0.05;
RUN; 
