create table if not exists survey_results_public(
    "Id" serial, 
    "Respondent" integer, 
    "Hobby" text, 
    "OpenSource" text, 
    "Country" text, 
    "Student" text, 
    "Employment" text, 
    "FormalEducation" text, 
    "UndergradMajor" text, 
    "CompanySize" text, 
    "DevType" text, 
    "YearsCoding" text, 
    "YearsCodingProf" text, 
    "JobSatisfaction" text, 
    "CareerSatisfaction" text, 
    "HopeFiveYears" text, 
    "JobSearchStatus" text, 
    "LastNewJob" text, 
    "AssessJob1" text, 
    "AssessJob2" text, 
    "AssessJob3" text, 
    "AssessJob4" text, 
    "AssessJob5" text, 
    "AssessJob6" text, 
    "AssessJob7" text, 
    "AssessJob8" text, 
    "AssessJob9" text, 
    "AssessJob10" text, 
    "AssessBenefits1" text, 
    "AssessBenefits2" text, 
    "AssessBenefits3" text, 
    "AssessBenefits4" text, 
    "AssessBenefits5" text, 
    "AssessBenefits6" text, 
    "AssessBenefits7" text, 
    "AssessBenefits8" text, 
    "AssessBenefits9" text, 
    "AssessBenefits10" text, 
    "AssessBenefits11" text, 
    "JobContactPriorities1" text, 
    "JobContactPriorities2" text, 
    "JobContactPriorities3" text, 
    "JobContactPriorities4" text, 
    "JobContactPriorities5" text, 
    "JobEmailPriorities1" text, 
    "JobEmailPriorities2" text, 
    "JobEmailPriorities3" text, 
    "JobEmailPriorities4" text, 
    "JobEmailPriorities5" text, 
    "JobEmailPriorities6" text, 
    "JobEmailPriorities7" text, 
    "UpdateCV" text, 
    "Currency" text, 
    "Salary" text, 
    "SalaryType" text, 
    "ConvertedSalary" text, 
    "CurrencySymbol" text, 
    "CommunicationTools" text, 
    "TimeFullyProductive" text, 
    "EducationTypes" text, 
    "SelfTaughtTypes" text, 
    "TimeAfterBootcamp" text, 
    "HackathonReasons" text, 
    "AgreeDisagree1" text, 
    "AgreeDisagree2" text, 
    "AgreeDisagree3" text, 
    "LanguageWorkedWith" text, 
    "LanguageDesireNextYear" text, 
    "DatabaseWorkedWith" text, 
    "DatabaseDesireNextYear" text, 
    "PlatformWorkedWith" text, 
    "PlatformDesireNextYear" text, 
    "FrameworkWorkedWith" text, 
    "FrameworkDesireNextYear" text, 
    "IDE" text, 
    "OperatingSystem" text, 
    "NumberMonitors" text, 
    "Methodology" text, 
    "VersionControl" text, 
    "CheckInCode" text, 
    "AdBlocker" text, 
    "AdBlockerDisable" text, 
    "AdBlockerReasons" text, 
    "AdsAgreeDisagree1" text, 
    "AdsAgreeDisagree2" text, 
    "AdsAgreeDisagree3" text, 
    "AdsActions" text, 
    "AdsPriorities1" text, 
    "AdsPriorities2" text, 
    "AdsPriorities3" text, 
    "AdsPriorities4" text, 
    "AdsPriorities5" text, 
    "AdsPriorities6" text, 
    "AdsPriorities7" text, 
    "AIDangerous" text, 
    "AIInteresting" text, 
    "AIResponsible" text, 
    "AIFuture" text, 
    "EthicsChoice" text, 
    "EthicsReport" text, 
    "EthicsResponsible" text, 
    "EthicalImplications" text, 
    "StackOverflowRecommend" text, 
    "StackOverflowVisit" text, 
    "StackOverflowHasAccount" text, 
    "StackOverflowParticipate" text, 
    "StackOverflowJobs" text, 
    "StackOverflowDevStory" text, 
    "StackOverflowJobsRecommend" text, 
    "StackOverflowConsiderMember" text, 
    "HypotheticalTools1" text, 
    "HypotheticalTools2" text, 
    "HypotheticalTools3" text, 
    "HypotheticalTools4" text, 
    "HypotheticalTools5" text, 
    "WakeTime" text, 
    "HoursComputer" text, 
    "HoursOutside" text, 
    "SkipMeals" text, 
    "ErgonomicDevices" text, 
    "Exercise" text, 
    "Gender" text, 
    "SexualOrientation" text, 
    "EducationParents" text, 
    "RaceEthnicity" text, 
    "Age" text, 
    "Dependents" text, 
    "MilitaryUS" text, 
    "SurveyTooLong" text, 
    "SurveyEasy" text, 

    primary key ("Id")
);

COPY survey_results_public(
    "Respondent",
    "Hobby",
    "OpenSource",
    "Country",
    "Student",
    "Employment",
    "FormalEducation",
    "UndergradMajor",
    "CompanySize",
    "DevType",
    "YearsCoding",
    "YearsCodingProf",
    "JobSatisfaction",
    "CareerSatisfaction",
    "HopeFiveYears",
    "JobSearchStatus",
    "LastNewJob",
    "AssessJob1",
    "AssessJob2",
    "AssessJob3",
    "AssessJob4",
    "AssessJob5",
    "AssessJob6",
    "AssessJob7",
    "AssessJob8",
    "AssessJob9",
    "AssessJob10",
    "AssessBenefits1",
    "AssessBenefits2",
    "AssessBenefits3",
    "AssessBenefits4",
    "AssessBenefits5",
    "AssessBenefits6",
    "AssessBenefits7",
    "AssessBenefits8",
    "AssessBenefits9",
    "AssessBenefits10",
    "AssessBenefits11",
    "JobContactPriorities1",
    "JobContactPriorities2",
    "JobContactPriorities3",
    "JobContactPriorities4",
    "JobContactPriorities5",
    "JobEmailPriorities1",
    "JobEmailPriorities2",
    "JobEmailPriorities3",
    "JobEmailPriorities4",
    "JobEmailPriorities5",
    "JobEmailPriorities6",
    "JobEmailPriorities7",
    "UpdateCV",
    "Currency",
    "Salary",
    "SalaryType",
    "ConvertedSalary",
    "CurrencySymbol",
    "CommunicationTools",
    "TimeFullyProductive",
    "EducationTypes",
    "SelfTaughtTypes",
    "TimeAfterBootcamp",
    "HackathonReasons",
    "AgreeDisagree1",
    "AgreeDisagree2",
    "AgreeDisagree3",
    "LanguageWorkedWith",
    "LanguageDesireNextYear",
    "DatabaseWorkedWith",
    "DatabaseDesireNextYear",
    "PlatformWorkedWith",
    "PlatformDesireNextYear",
    "FrameworkWorkedWith",
    "FrameworkDesireNextYear",
    "IDE",
    "OperatingSystem",
    "NumberMonitors",
    "Methodology",
    "VersionControl",
    "CheckInCode",
    "AdBlocker",
    "AdBlockerDisable",
    "AdBlockerReasons",
    "AdsAgreeDisagree1",
    "AdsAgreeDisagree2",
    "AdsAgreeDisagree3",
    "AdsActions",
    "AdsPriorities1",
    "AdsPriorities2",
    "AdsPriorities3",
    "AdsPriorities4",
    "AdsPriorities5",
    "AdsPriorities6",
    "AdsPriorities7",
    "AIDangerous",
    "AIInteresting",
    "AIResponsible",
    "AIFuture",
    "EthicsChoice",
    "EthicsReport",
    "EthicsResponsible",
    "EthicalImplications",
    "StackOverflowRecommend",
    "StackOverflowVisit",
    "StackOverflowHasAccount",
    "StackOverflowParticipate",
    "StackOverflowJobs",
    "StackOverflowDevStory",
    "StackOverflowJobsRecommend",
    "StackOverflowConsiderMember",
    "HypotheticalTools1",
    "HypotheticalTools2",
    "HypotheticalTools3",
    "HypotheticalTools4",
    "HypotheticalTools5",
    "WakeTime",
    "HoursComputer",
    "HoursOutside",
    "SkipMeals",
    "ErgonomicDevices",
    "Exercise",
    "Gender",
    "SexualOrientation",
    "EducationParents",
    "RaceEthnicity",
    "Age",
    "Dependents",
    "MilitaryUS",
    "SurveyTooLong",
    "SurveyEasy"
)
FROM '/home/survey_results_public.csv'
DELIMITER ','
CSV HEADER;