-- DROP DATABASE "CEDS";

CREATE DATABASE "CEDS"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
    
    
COMMENT ON DATABASE "CEDS"
    IS 'CEDS data standard, version 6';

 
 CREATE TABLE Achievement(
 	AchievementId SERIAL NOT NULL,
 	PersonId INTEGER NOT NULL,
 	Title VARCHAR(300) NULL,
 	Description VARCHAR(300),
 	Category VARCHAR(60),
 	CategorySystem VARCHAR(50),
 	ImageUrl VARCHAR(300),
 	Criteria VARCHAR(300),
 	CriteriaUrl VARCHAR(300),
 	CompetencySetId INTEGER,
 	StartDate date,
 	EndDate date,
 	AwardIssuerName VARCHAR(128) ,
 	AwardIssuerOriginURL VARCHAR(300) 
 );
 
ALTER TABLE Achievement ADD CONSTRAINT PK_Achievement  PRIMARY KEY ( AchievementId ) ;
    
CREATE TABLE AchievementEvidence(
	AchievementEvidenceId SERIAL NOT NULL,
	AchievementId INTEGER,
	Statement VARCHAR(300),
	AssessmentSubtestResultId INTEGER);
	

ALTER TABLE AchievementEvidence ADD CONSTRAINT PK_AchievementEvidence  PRIMARY KEY ( AchievementEvidenceId ) ;

CREATE TABLE Activity(
	OrganizationId SERIAL NOT NULL,
	ActivityDescription VARCHAR(300) NULL);
	
ALTER TABLE Activity ADD CONSTRAINT PK_Activity  PRIMARY KEY ( OrganizationId ) ;

CREATE TABLE ActivityRecognition(
	ActivityRecognitionId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefActivityRecognitionTypeId INTEGER NOT NULL);  
	


CREATE TABLE AeCourse(
	OrganizationId INTEGER NOT NULL,
	RefCourseLevelTypeId INTEGER NULL,
	RefCareerClusterId INTEGER NULL);  


CREATE TABLE AeProvider(
	OrganizationId INTEGER NOT NULL,
	RefLevelOfInstitutionId INTEGER NOT NULL);  

CREATE TABLE AeStaff(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefAeStaffClassificationId INTEGER NULL,
	RefAeStaffEmploymentStatusId INTEGER NULL,
	YearsOfPriorAeTeachingExperience decimal(4, 2) NULL,
	RefAeCertificationTypeId INTEGER NULL);  

CREATE TABLE AeStudentAcademicRecord(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefHighSchoolDiplomaTypeId INTEGER NULL,
	DiplomaOrCredentialAwardDate varchar(7) NULL,
	RefProfessionalTechnicalCredentialTypeId INTEGER NULL);  

CREATE TABLE AeStudentEmployment(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefEmployedWhileEnrolledId INTEGER NULL,
	RefEmployedAfterExitId INTEGER NULL,
	EmploymentNaicsCode varchar(6) NULL);  
	
CREATE TABLE ApipInteraction(
	ApipInteractionId SERIAL NOT NULL,
	AssessmentItemId INTEGER NOT NULL,
	RefApipInteractionTypeId INTEGER NULL,
	Xml XML NULL,
	SequenceNumber INTEGER NULL,
	APIPInteractionSequenceNumber decimal(9, 2) NULL); 
	
	
CREATE TABLE Application(
	ApplicationId SERIAL NOT NULL,
	Name varchar(120) NOT NULL,
	Uri varchar(300) NULL);  

CREATE TABLE Assessment(
	AssessmentId SERIAL NOT NULL,
	Identifier varchar(40) NULL,
	IdentificationSystem INTEGER NULL,
	GUID varchar(40) NULL,
	Title varchar(60) NULL,
	ShortName varchar(30) NULL,
	RefAcademicSubjectId INTEGER NOT NULL,
	Objective varchar(100) NULL,
	Provider varchar(30) NULL,
	RefAssessmentPurposeId INTEGER NULL,
	RefAssessmentTypeId INTEGER NULL,
	RefAssessmentTypeChildrenWithDisabilitiesId INTEGER NULL,
	AssessmentRevisionDate date NULL,
	AssessmentFamilyTitle varchar(60) NOT NULL,
	AssessmentFamilyShortName varchar(30) NULL);  
	
	
CREATE TABLE Assessment_AssessmentAdministration(
	Assessment_AssessmentAdministrationId SERIAL NOT NULL,
	AssessmentId INTEGER NOT NULL,
	AssessmentAdministrationId INTEGER NOT NULL);
	
CREATE TABLE AssessmentAdministration(
	AssessmentAdministrationId SERIAL NOT NULL,
	AssessmentId INTEGER NULL,
	Name varchar(30) NULL,
	Code varchar(30) NULL,
	StartDate date NULL,
	StartTime time(7) NULL,
	FinishDate date NULL,
	FinishTime time(7) NULL,
	RefAssessmentReportingMethodId INTEGER NULL,
	AssessmentSecureIndicator bit NULL,
	AssessmentAdministrationPeriodDescription varchar(300) NULL);  








CREATE TABLE AssessmentAdministration_Organization(
	AssessmentAdministration_OrganizationId SERIAL NOT NULL,
	AssessmentAdministrationId INTEGER NOT NULL,
	OrganizationId INTEGER NOT NULL);  

CREATE TABLE AssessmentAsset(
	AssessmentAssetId SERIAL NOT NULL,
	Version varchar(30) NULL,
	PublishedDate date NULL,
	Identifier varchar(40) NULL,
	RefAssessmentAssestIdentifierType INTEGER NULL,
	Name varchar(60) NULL,
	RefAssessmentAssetTypeId INTEGER NULL,
	Owner varchar(60) NULL,
	RefAssessmentLanguageId INTEGER NULL,
	ContentXML XML NULL,
	ContentMimeType XML NULL,
	ContentUrl varchar(300) NULL,
	LearningResourceId INTEGER NULL);  








CREATE TABLE AssessmentELDevelopmentalDomain(
	AssessmentELDevelopmentalDomainId SERIAL NOT NULL,
	AssessmentId INTEGER NOT NULL,
	RefAssessmentELDevelopmentalDomainId INTEGER NOT NULL);    
 








CREATE TABLE AssessmentForm(
	AssessmentFormId SERIAL NOT NULL,
	AssessmentId INTEGER NOT NULL,
	FormNumber varchar(30) NULL,
	Name varchar(40) NULL,
	Version varchar(30) NULL,
	PublishedDate date NULL,
	AccommodationList XML NULL,
	IntendedAdministrationStartDate date NULL,
	IntendedAdministrationEndDate date NULL,
	AssessmentItemBankIdentifier varchar(40) NULL,
	AssessmentItemBankName varchar(60) NULL,
	PlatformsSupported XML NULL,
	RefAssessmentLanguageId INTEGER NULL,
	AssessmentSecureIndicator bit NULL,
	LearningResourceId INTEGER NULL,
	AssessmentFormAdaptiveIndicator bit NULL,
	AssessmentFormAlgorithmIdentifier varchar(40) NULL,
	AssessmentFormAlgorithmVersion varchar(40) NULL,
	AssessmentFormGUID varchar(40) NULL);  


CREATE TABLE K12StudentLiteracyAssessment(
	OrganizationPersonRoleId int NOT NULL,
	RefLiteracyAssessmentId int NULL,
	LiteracyPreTestStatus bit NULL,
	LiteracyPostTestStatus bit NULL,
	LiteracyGoalMetStatus bit NULL);

CREATE TABLE K12StudentSession(
	K12StudentSessionId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	OrganizationCalendarSessionId INTEGER NULL,
	GradePointAverageGivenSession decimal(9, 4) NULL);



CREATE TABLE AssessmentForm_AssessmentAsset(
	AssessmentForm_AssessmentAssetId SERIAL NOT NULL,
	AssessmentFormId INTEGER NOT NULL,
	AssessmentAssetId INTEGER NOT NULL);  




CREATE TABLE K12StudentGraduationPlan(
	OrganizationPersonRoleId INTEGER NOT NULL,
	K12CourseId INTEGER NOT NULL,
	CreditsRequired decimal(9, 2) NULL,
	RefSCEDCourseSubjectAreaId INTEGER NULL,
	RefGradeLevelWhenCourseTakenId INTEGER NULL);




CREATE TABLE AssessmentForm_AssessmentFormSection(
	AssessmentForm_AssessmentFormSectionId SERIAL NOT NULL,
	AssessmentFormId INTEGER NOT NULL,
	AssessmentFormSectionId INTEGER NOT NULL,
	SequenceNumber INTEGER NULL);  



CREATE TABLE AssessmentFormSection(
	AssessmentFormSectionId SERIAL NOT NULL,
	Identifier varchar(40) NULL,
	RefAssessmentFormSectionIdentificationSystemId INTEGER NULL,
	PublishedDate date NULL,
	Version varchar(30) NULL,
	SectionTimeLimit time(7) NULL,
	SectionSealed bit NULL,
	SectionReentry bit NULL,
	AssessmentItemBankIdentifier varchar(40) NULL,
	AssessmentItemBankName varchar(60) NULL,
	ChildOf_FormSectionId INTEGER NULL,
	LearningResourceId INTEGER NULL,
	GUID varchar(40) NULL);  
	
CREATE TABLE AssessmentFormSection_AssessmentAsset(
	AssessmentFormSection_AssessmentAssetId SERIAL NOT NULL,
	AssessmentFormSectionId INTEGER NOT NULL,
	AssessmentAssetId INTEGER NOT NULL);    








CREATE TABLE AssessmentFormSection_AssessmentItem(
	AssessmentFormSectionItemId SERIAL NOT NULL,
	SequenceNumber INTEGER NOT NULL,
	AssessmentFormSectionId INTEGER NOT NULL,
	AssessmentItemId INTEGER NOT NULL);  








CREATE TABLE AssessmentItem(
	AssessmentItemId SERIAL NOT NULL,
	Identifier varchar(40) NULL,
	AssessmentItemBankIdentifier varchar(40) NULL,
	AssessmentItemBankName varchar(60) NULL,
	RefAssessmentItemTypeId INTEGER NULL,
	BodyText XML NULL,
	Stimulus XML NULL,
	Stem XML NULL,
	AdaptiveIndicator bit NULL,
	MaximumScore varchar(300) NULL,
	MinimumScore varchar(300) NULL,
	DistractorAnalysis varchar(100) NULL,
	AllottedTime time(7) NULL,
	RefNaepMathComplexityLevelId INTEGER NULL,
	RefNaepAspectsOfReadingId INTEGER NULL,
	Difficulty decimal(5, 2) NULL,
	RefTextComplexitySystemId INTEGER NULL,
	TextComplexityValue varchar(30) NULL,
	LinkingItemIndicator bit NULL,
	ReleaseStatus bit NULL,
	RubricId INTEGER NULL,
	LearningResourceId INTEGER NULL,
	AssessmentFormSectionItemFieldTestIndicator bit NULL);  




 CREATE TABLE AssessmentLevelsForWhichDesigned(
 	AssessmentLevelsForWhichDesignedId SERIAL NOT NULL,
 	AssessmentId INTEGER NOT NULL,
 	RefGradeLevelId INTEGER NOT NULL);    
 
 
 
 CREATE TABLE AssessmentNeedApipContent(
 	AssessmentNeedApipContentId SERIAL NOT NULL,
 	AssessmentPersonalNeedsProfileContentId INTEGER NOT NULL,
 	ItemTranslationDisplayLanguageTypeId INTEGER NULL,
 	KeywordTranslationLanguageTypeId INTEGER NULL,
 	RefAssessmentNeedSigningTypeId INTEGER NULL,
 	RefAssessmentNeedAlternativeRepresentationTypeId INTEGER NULL,
 	RefAssessmentNeedSpokenSourcePreferenceTypeId INTEGER NULL,
 	ReadAtStartPreferenceIndicator bit NULL,
 	RefAssessmentNeedUserSpokenPreferenceTypeId INTEGER NULL,
 	AssessmentNeedDirectionsOnlyIndicator bit NULL);  
 
 
 CREATE TABLE AssessmentNeedApipControl(
 	AssessmentNeedApipControlId SERIAL NOT NULL,
 	AssessmentPersonalNeedsProfileControlId INTEGER NOT NULL,
 	AssessmentNeedTimeMultiplier varchar(9) NULL,
 	LineReaderHighlightColor varchar(6) NULL,
 	OverlayColor varchar(6) NULL,
 	BackgroundColor varchar(6) NULL,
 	RefAssessmentNeedIncreasedWhitespacingTypeId INTEGER NULL);  
 
 
 
 
 
 
 
 
 CREATE TABLE AssessmentNeedApipDisplay(
 	AssessmentNeedApipDisplayId SERIAL NOT NULL,
 	AssessmentPersonalNeedsProfileDisplayId INTEGER NOT NULL,
 	MaskingAssignedSupportIndicator bit NULL,
 	MaskingActivateByDefaultIndicator bit NULL,
 	RefAssessmentNeedMaskingTypeId INTEGER NULL,
 	EncouragementAssignedSupportIndicator bit NULL,
 	EncouragementActivateByDefaultIndicator bit NULL,
 	EncouragementTextMessagingString varchar(4000) NULL,
 	EncouragementSoundFileUrl varchar(300) NULL);  
 
 
 
 
 
 
 
 
 CREATE TABLE AssessmentNeedBraille(
 	AssessmentNeedBrailleId SERIAL NOT NULL,
 	AssessmentPersonalNeedsProfileDisplayId INTEGER NULL,
 	RefAssessmentNeedUsageTypeId INTEGER NULL,
 	RefAssessmentNeedBrailleGradeTypeId INTEGER NULL,
 	RefAssessmentNeedNumberOfBrailleDotsId INTEGER NULL,
 	NumberOfBrailleCells INTEGER NULL,
 	RefAssessmentNeedBrailleMarkTypeId INTEGER NULL,
 	BrailleDotPressure decimal(10, 4) NULL,
 	RefAssessmentNeedBrailleStatusCellTypeId INTEGER NULL);  


CREATE TABLE AssessmentNeedScreenEnhancement(
	AssessmentNeedScreenEnhancementId SERIAL NOT NULL,
	AssessmentPersonalNeedsProfileDisplayId INTEGER NOT NULL,
	InvertColorChoice bit NULL,
	Magnification decimal(10, 4) NULL,
	AssessmentPersonalNeedsProfileScreenEnhancementId INTEGER NULL,
	ForegroundColor varchar(6) NULL);  
	

CREATE TABLE AssessmentParticipantSession(
	AssessmentParticipantSessionId SERIAL NOT NULL,
	ActualStartDateTime timestamp NULL,
	ActualEndDateTime timestamp NULL,
	TimeAssessed varchar(30) NULL,
	RefAssessmentPlatformTypeId INTEGER NULL,
	DeliveryDeviceDetails varchar(300) NULL,
	SecurityIssue varchar(300) NULL,
	RefAssessmentSessionSpecialCircumstanceTypeId INTEGER NULL,
	SpecialEventDescription varchar(60) NULL,
	LocationId INTEGER NULL,
	RefLanguageId INTEGER NULL,
	AssessmentFormSectionId INTEGER NULL,
	AssessmentSessionId INTEGER NOT NULL,
	AssessmentRegistrationId INTEGER NULL,
	AssessmentParticipantSessionDatabaseName varchar(300) NULL,
	AssessmentParticipantSessionGUID varchar(40) NULL);  
	








CREATE TABLE AssessmentParticipantSession_Accommodation(
	AssessmentParticipantSession_AccommodationId SERIAL NOT NULL,
	AssessmentParticipantSessionId INTEGER NOT NULL,
	RefAssessmentAccommodationTypeId INTEGER NOT NULL,
	RefAssessmentAccommodationCategoryId INTEGER NULL);    








CREATE TABLE AssessmentPerformanceLevel(
	AssessmentPerformanceLevelId SERIAL NOT NULL,
	Identifier varchar(40) NULL,
	AssessmentSubtestId INTEGER NULL,
	ScoreMetric varchar(30) NULL,
	Label varchar(20) NULL,
	LowerCutScore varchar(30) NULL,
	UpperCutScore varchar(30) NULL,
	DescriptiveFeedback XML NULL);  








CREATE TABLE AssessmentPersonalNeedLanguageLearner(
	AssessmentPersonalNeedLanguageLearnerId SERIAL NOT NULL,
	AssessmentNeedsProfileContentId INTEGER NOT NULL,
	AssignedSupport bit NULL,
	ActivateByDefault bit NULL,
	RefAssessmentNeedsProfileContentLanguageLearnerTypeId INTEGER NOT NULL);  









CREATE TABLE AssessmentPersonalNeedScreenReader(
	AssessmentPersonalNeedScreenReaderId SERIAL NOT NULL,
	AssessmentPersonalNeedsProfileDisplayId INTEGER NOT NULL,
	RefAssessmentNeedUsageTypeId INTEGER NULL,
	SpeechRate INTEGER NULL,
	Pitch decimal(10, 4) NULL,
	Volume decimal(10, 4) NULL);  








CREATE TABLE AssessmentPersonalNeedsProfile(
	AssessmentPersonalNeedsProfileId SERIAL NOT NULL,
	AssessmentNeedType XML NOT NULL,
	AssignedSupportFlag bit NULL,
	ActivateByDefault bit NULL);  



CREATE TABLE AssessmentPersonalNeedsProfileContent(
	AssessmentPersonalNeedsProfileContentId SERIAL NOT NULL,
	AssessmentPersonalNeedsProfileId INTEGER NOT NULL,
	RefAssessmentNeedHazardTypeId INTEGER NULL,
	RefAssessmentNeedSupportToolId INTEGER NULL,
	CognitiveGuidanceActivateByDefaultIndicator bit NULL,
	CognitiveGuidanceAssignedSupportIndicator bit NULL,
	ScaffoldingAssignedSupportIndicator bit NULL,
	ScaffoldingActivateByDefaultIndicator bit NULL,
	ChunkingAssignedSupportIndicator bit NULL,
	ChunkingActivateByDefaultIndicator bit NULL,
	KeywordEmphasisAssignedSupportIndicator bit NULL,
	KeywordEmphasisActivateByDefaultIndicator bit NULL,
	ReducedAnswersAssignedSupportIndicator bit NULL,
	ReducedAnswersActivateByDefaultIndicator bit NULL,
	NegativesRemovedAssignedSupportIndicator bit NULL,
	NegativesRemovedActivateByDefaultIndicator bit NULL,
	RefKeywordTranslationsLanguageId INTEGER NULL,
	KeywordTranslationsAssignedSupportIndicator bit NULL,
	KeywordTranslationsActivateByDefaultIndicator bit NULL);  








CREATE TABLE AssessmentPersonalNeedsProfileControl(
	AssessmentPersonalNeedsProfileControlId SERIAL NOT NULL,
	AssessmentPersonalNeedsProfileId INTEGER NOT NULL);  








CREATE TABLE AssessmentPersonalNeedsProfileDisplay(
	AssessmentPersonalNeedsProfileDisplayId SERIAL NOT NULL,
	AssessmentPersonalNeedsProfileId INTEGER NOT NULL);  








CREATE TABLE AssessmentPersonalNeedsProfileScreenEnhancement(
	AssessmentPersonalNeedsProfileScreenEnhancementId SERIAL NOT NULL,
	AssessmentPersonalNeedsProfileId INTEGER NOT NULL);  








CREATE TABLE AssessmentRegistration(
	AssessmentRegistrationId SERIAL NOT NULL,
	CreationDate timestamp NULL,
	DaysOfInstructionPriorToAssessment INTEGER NULL,
	ScorePublishDate date NULL,
	TestAttemptIdentifier varchar(40) NULL,
	RetestIndicator bit NULL,
	CourseSectionOrganizationId INTEGER NULL,
	RefAssessmentParticipationIndicatorId INTEGER NULL,
	TestingIndicator varchar(300) NULL,
	RefAssessmentPurposeId INTEGER NULL,
	RefAssessmentReasonNotTestedId INTEGER NULL,
	RefAssessmentReasonNotCompletingId INTEGER NULL,
	RefGradeLevelToBeAssessedId INTEGER NULL,
	RefGradeLevelWhenAssessedId INTEGER NULL,
	PersonId INTEGER NOT NULL,
	AssessmentFormId INTEGER NOT NULL,
	OrganizationId INTEGER NULL,
	SchoolOrganizationId INTEGER NULL,
	LeaOrganizationId INTEGER NULL,
	AssessmentAdministrationId INTEGER NULL,
	AssignedByPersonId INTEGER NULL,
	AssessmentRegistrationCompletionStatusDateTime timestamp NULL,
	RefAssessmentRegistrationCompletionStatusId INTEGER NULL);  








CREATE TABLE AssessmentRegistration_Accommodation(
	AssessmentRegistration_AccommodationId SERIAL NOT NULL,
	AssessmentRegistrationId INTEGER NOT NULL,
	RefAssessmentAccommodationTypeId INTEGER NOT NULL,
	OtherDescription varchar(30) NULL,
	RefAssessmentAccommodationCategoryId INTEGER NULL);    








CREATE TABLE AssessmentResult(
	AssessmentResultId SERIAL NOT NULL,
	ScoreValue varchar(35) NULL,
	RefScoreMetricTypeId INTEGER NULL,
	PreliminaryIndicator bit NULL,
	RefAssessmentPretestOutcomeId INTEGER NULL,
	NumberOfResponses INTEGER NULL,
	DiagnosticStatement XML NULL,
	DiagnosticStatementSource varchar(300) NULL,
	DescriptiveFeedback varchar(300) NULL,
	DescriptiveFeedbackSource varchar(60) NULL,
	InstructionalRecommendation varchar(100) NULL,
	IncludedInAypCalculation bit NULL,
	DateUpdated date NULL,
	DateCreated date NULL,
	AssessmentSubtestId INTEGER NOT NULL,
	AssessmentRegistrationId INTEGER NOT NULL,
	RefELOutcomeMeasurementLevelId INTEGER NULL,
	RefOutcomeTimePointId INTEGER NULL,
	AssessmentResultDescriptiveFeedbackDateTime timestamp NULL,
	AssessmentResultScoreStandardError decimal(9, 2) NULL,
	RefAssessmentResultDataTypeId INTEGER NULL,
	RefAssessmentResultScoreTypeId INTEGER NULL);  








CREATE TABLE AssessmentResult_PerformanceLevel(
	AssessmentResult_PerformanceLevelId SERIAL NOT NULL,
	AssessmentResultId INTEGER NOT NULL,
	AssessmentPerformanceLevelId INTEGER NOT NULL);  








CREATE TABLE AssessmentResultRubricCriterionResult(
	AssessmentResultRubricCriterionResultId SERIAL NOT NULL,
	AssessmentResultId INTEGER NOT NULL,
	RubricCriterionLevelId INTEGER NOT NULL);    








CREATE TABLE AssessmentSession(
	AssessmentSessionId SERIAL NOT NULL,
	AssessmentAdministrationId INTEGER NULL,
	ScheduledStartDateTime timestamp NULL,
	ScheduledEndDateTime timestamp NULL,
	ActualStartDateTime timestamp NULL,
	ActualEndDateTime timestamp NULL,
	AllottedTime time(7) NULL,
	RefAssessmentSessionTypeId INTEGER NULL,
	SecurityIssue varchar(300) NULL,
	RefAssessmentSessionSpecialCircumstanceTypeId INTEGER NULL,
	SpecialEventDescription varchar(60) NULL,
	Location varchar(45) NULL,
	OrganizationId INTEGER NULL,
	Lea_OrganizationId INTEGER NULL,
	School_OrganizationId INTEGER NULL);  








CREATE TABLE AssessmentSessionStaffRole(
	AssessmentSessionStaffRoleId SERIAL NOT NULL,
	RefAssessmentSessionStaffRoleTypeId INTEGER NULL,
	PersonId INTEGER NOT NULL,
	AssessmentSessionId INTEGER NULL,
	AssessmentParticipantSessionId INTEGER NULL);  








CREATE TABLE AssessmentSubtest(
	AssessmentSubtestId SERIAL NOT NULL,
	Identifier varchar(40) NULL,
	RefAssessmentSubtestIdentifierTypeId INTEGER NULL,
	Title varchar(60) NULL,
	Version varchar(30) NULL,
	PublishedDate date NULL,
	Abbreviation varchar(30) NULL,
	RefScoreMetricTypeId INTEGER NULL,
	MinimumValue varchar(30) NULL,
	MaximumValue varchar(30) NULL,
	OptimalValue varchar(30) NULL,
	Tier INTEGER NULL,
	ContainerOnly varchar(30) NULL,
	RefAssessmentPurposeId INTEGER NULL,
	Description varchar(60) NULL,
	Rules XML NULL,
	RefContentStandardTypeId INTEGER NULL,
	RefAcademicSubjectId INTEGER NULL,
	ChildOf_AssessmentSubtestId INTEGER NULL,
	AssessmentFormId INTEGER NULL);  








CREATE TABLE AssessmentSubtest_AssessmentItem(
	AssessmentSubtestItemId SERIAL NOT NULL,
	AssessmentSubtestId INTEGER NOT NULL,
	AssessmentItemId INTEGER NOT NULL,
	ItemWeightCorrect decimal(3, 2) NULL,
	ItemWeightIncorrect decimal(3, 2) NULL,
	ItemWeightNotAttempted decimal(3, 2) NULL);  








CREATE TABLE AssessmentSubtest_LearningStandardItem(
	AssessmentSubTest_LearningStandardItemId SERIAL NOT NULL,
	AssessmentSubtestId INTEGER NOT NULL,
	LearningStandardItemId INTEGER NOT NULL);    


 

CREATE TABLE Authentication(
	AuthenticationId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	IdentityProviderName varchar(60) NULL,
	IdentityProviderUri varchar(300) NULL,
	LoginIdentifier varchar(40) NULL,
	StartDate date NULL,
	EndDate date NULL);  
	
	
	
	

CREATE TABLE Authorizations(
	AuthorizationId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	ApplicationId INTEGER NULL,
	ApplicationRoleName varchar(60) NOT NULL,
	StartDate date NULL,
	EndDate date NULL);  
	
	
	




CREATE TABLE Classroom(
	LocationId INTEGER NOT NULL,
	ClassroomIdentifier varchar(40) NULL);  








CREATE TABLE CompetencyItem_CompetencySet(
	CompetencyItem_CompetencySetId SERIAL NOT NULL,
	LearningStandardItemId INTEGER NOT NULL,
	CompetencySetId INTEGER NOT NULL);    








CREATE TABLE CompetencySet(
	CompetencySetId SERIAL NOT NULL,
	ChildOf_CompetencySet INTEGER NULL,
	RefCompletionCriteriaId INTEGER NULL,
	CompletionCriteriaThreshold INTEGER NULL);  








CREATE TABLE CoreKnowledgeArea(
	CoreKnowledgeAreaId SERIAL NOT NULL,
	ProfessionalDevelopmentActivityId INTEGER NOT NULL,
	RefCoreKnowledgeAreaId INTEGER NOT NULL);    








CREATE TABLE Course(
	OrganizationId INTEGER NOT NULL,
	Description varchar(60) NULL,
	SubjectAbbreviation varchar(50) NULL,
	SCEDSequenceOfCourse varchar(50) NULL,
	InstructionalMinutes INTEGER NULL,
	RefCourseLevelCharacteristicsId INTEGER NULL,
	RefCourseCreditUnitId INTEGER NULL,
	CreditValue decimal(9, 2) NULL,
	RefInstructionLanguage INTEGER NULL,
	CertificationDescription varchar(300) NULL,
	RefCourseApplicableEducationLevelId INTEGER NULL);  








CREATE TABLE CourseSection(
	OrganizationId INTEGER NOT NULL,
	AvailableCarnegieUnitCredit decimal(9, 2) NULL,
	RefCourseSectionDeliveryModeId INTEGER NULL,
	RefSingleSexClassStatusId INTEGER NULL,
	TimeRequiredForCompletion decimal(9, 0) NULL,
	CourseId INTEGER NOT NULL,
	RefAdditionalCreditTypeId INTEGER NULL,
	RefInstructionLanguageId INTEGER NULL,
	VirtualIndicator bit NULL,
	OrganizationCalendarSessionId INTEGER NULL,
	RefCreditTypeEarnedId INTEGER NULL,
	RelatedLearningStandards varchar(60) NULL,
	RefAdvancedPlacementCourseCodeId INTEGER NULL,
	MaximumCapacity INTEGER NULL);  








CREATE TABLE CourseSectionAssessmentReporting(
	CourseSectionAssessmentReportingId SERIAL NOT NULL,
	OrganizationId INTEGER NULL,
	RefCourseSectionAssessmentReportingMethodId INTEGER NULL);  








CREATE TABLE CourseSectionLocation(
	CourseSectionLocationId SERIAL NOT NULL,
	LocationId INTEGER NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefInstructionLocationTypeId INTEGER NULL);  








CREATE TABLE CourseSectionSchedule(
	CourseSectionScheduleId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	ClassMeetingDays varchar(60) NULL,
	ClassBeginningTime time(7) NULL,
	ClassEndingTime time(7) NULL,
	ClassPeriod varchar(30) NULL,
	TimeDayIdentifier varchar(40) NULL);  








CREATE TABLE CteCourse(
	OrganizationId INTEGER NOT NULL,
	AvailableCarnegieUnitCredit decimal(9, 2) NULL,
	RefAdditionalCreditTypeId INTEGER NULL,
	RefCreditTypeEarnedId INTEGER NULL,
	HighSchoolCourseRequirement bit NULL,
	RefCourseGpaApplicabilityId INTEGER NULL,
	CoreAcademicCourse bit NULL,
	RefCurriculumFrameworkTypeId INTEGER NULL,
	CourseAlignedWithStandards bit NULL,
	SCEDCourseCode varchar(5) NULL,
	RefSCEDCourseLevelId INTEGER NULL,
	RefSCEDCourseSubjectAreaId INTEGER NULL,
	RefCareerClusterId INTEGER NULL,
	CourseDepartmentName varchar(60) NULL);  




CREATE TABLE CteStudentAcademicRecord(
	OrganizationPersonRoleId INTEGER NOT NULL,
	CreditsAttemptedCumulative decimal(9, 2) NULL,
	CreditsEarnedCumulative decimal(9, 2) NULL,
	RefProfessionalTechnicalCredentialTypeId INTEGER NULL,
	DiplomaOrCredentialAwardDate varchar(7) NULL);  








CREATE TABLE EarlyChildhoodCredential(
	PersonCredentialId INTEGER NOT NULL,
	RefEarlyChildhoodCredentialId INTEGER NOT NULL);  








CREATE TABLE EarlyChildhoodProgramTypeOffered(
	EarlyChildhoodProgramTypeOfferedId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefEarlyChildhoodProgramEnrollmentTypeId INTEGER NOT NULL,
	InclusiveSettingIndicator bit NULL,
	RefCommunityBasedTypeId INTEGER NULL);    








CREATE TABLE ELChildDemographic(
	PersonId INTEGER NOT NULL,
	FosterCareStartDate date NULL,
	FosterCareEndDate date NULL,
	OtherRaceIndicator bit NULL);  








CREATE TABLE ELChildDevelopmentalAssessment(
	PersonId INTEGER NOT NULL,
	RefChildDevelopmentalScreeningStatusId INTEGER NULL,
	RefDevelopmentalEvaluationFindingId INTEGER NULL);  








CREATE TABLE ELChildHealth(
	PersonId INTEGER NOT NULL,
	WellChildScreeningReceivedDate date NULL,
	RefScheduledWellChildScreeningId INTEGER NULL);  








CREATE TABLE ELChildIndividualizedProgram(
	PersonId INTEGER NOT NULL,
	RefIDEAIEPStatusId INTEGER NULL,
	IndividualizedProgramId INTEGER NULL,
	RefIDEAPartCEligibilityCategoryId INTEGER NULL);  








CREATE TABLE ELChildOutcomeSummary(
	PersonId INTEGER NOT NULL,
	COSProgressAIndicator bit NULL,
	COSProgressBIndicator bit NULL,
	COSProgressCIndicator bit NULL,
	COSRatingAId INTEGER NULL,
	COSRatingBId INTEGER NULL,
	COSRatingCId INTEGER NULL);  








CREATE TABLE ELChildProgramEligibility(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefELProgramEligibilityStatusId INTEGER NULL,
	StatusDate date NULL,
	ExpirationDate date NULL);  








CREATE TABLE ELChildService(
	OrganizationPersonRoleId INTEGER NOT NULL,
	ECEAPEligibility bit NULL,
	EligibilityPriorityPoints varchar(100) NULL,
	ReasonForDeclinedServices XML NULL,
	ServiceDate date NULL,
	RefEarlyChildhoodServicesOfferedId INTEGER NULL,
	RefEarlyChildhoodServicesReceivedId INTEGER NULL,
	RefELServiceTypeId INTEGER NULL);  








CREATE TABLE ELChildServicesApplication(
	OrganizationPersonRoleId INTEGER NOT NULL,
	ELApplicationIdentifier varchar(40) NULL,
	ApplicationDate date NULL,
	ELEnrollmentApplicationDocumentIdentifier varchar(40) NULL,
	ELEnrollmentApplicationDocumentName varchar(60) NULL,
	ELEnrollmentApplicationDocumentType varchar(100) NULL,
	ELApplicationRequiredDocument bit NULL,
	ELEnrollmentApplicationVerificationDate date NULL,
	ELEnrollmentApplicationVerificationReasonType varchar(100) NULL,
	SitePreferenceRank varchar(300) NULL);  
CREATE TABLE ELChildTransitionPlan(
	PersonId INTEGER NOT NULL,
	PartB619PotentialEligibilityInd bit NULL,
	IDEAPartCToPartBNotificationDate date NULL,
	TransitionConferenceDate date NULL,
	TransitionConferenceDeclineDate date NULL,
	DateOfTransitionPlan date NULL,
	IDEAPartCToPartBNotificationOptOutDate date NULL,
	IDEAPartCToPartBNotificationOptOutIndicator bit NULL,
	RefReasonDelayTransitionConfId INTEGER NULL,
	IndividualizedProgramId INTEGER NULL);  








CREATE TABLE ELClassSection(
	OrganizationId INTEGER NOT NULL,
	RefServiceOptionId INTEGER NULL,
	HoursAvailablePerDay decimal(4, 2) NULL,
	DaysAvailablePerWeek INTEGER NULL,
	RefEnvironmentSettingId INTEGER NULL,
	ELProgramAnnualOperatingWeeks INTEGER NULL,
	LanguageTranslationPolicy bit NULL,
	GroupSize INTEGER NULL);  








CREATE TABLE ELClassSectionService(
	ELClassSectionServiceId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	YoungestAgeServed INTEGER NULL,
	OldestAgeServed INTEGER NULL,
	ServesChildrenWithSpecialNeeds bit NULL,
	RefELGroupSizeStandardMetId INTEGER NULL,
	ELClassGroupCurriculumType varchar(60) NULL,
	RefFrequencyOfServiceId INTEGER NULL);  








CREATE TABLE ELEnrollment(
	OrganizationPersonRoleId INTEGER NOT NULL,
	ApplicationDate date NULL,
	EnrollmentDate date NULL,
	RefIDEAEnvironmentELId INTEGER NULL,
	NumberOfDaysInAttendance decimal(8, 2) NULL,
	RefFoodServiceParticipationId INTEGER NULL,
	RefServiceOptionId INTEGER NULL,
	ELClassSectionId INTEGER NULL,
	RefELFederalFundingTypeId INTEGER NULL);  








CREATE TABLE ELEnrollmentOtherFunding(
	ELEnrollmentOtherFundingId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	RefELOtherFederalFundingSourcesId INTEGER NOT NULL);  








CREATE TABLE ELFacilityLicensing(
	ELFacilityLicensingId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefELFacilityLicensingStatusId INTEGER NULL,
	StateLicensedFacilityCapacity INTEGER NULL,
	InitialLicensingDate date NULL,
	ContinuingLicenseDate date NULL,
	RefLicenseExemptId INTEGER NULL);  








CREATE TABLE ELOrganizationAvailability(
	OrganizationId INTEGER NOT NULL,
	DaysAvailablePerWeek INTEGER NULL,
	HoursAvailablePerDay INTEGER NULL,
	YoungestAgeServed INTEGER NULL,
	OldestAgeServed INTEGER NULL,
	AgeUnit varchar(10) NULL,
	RefEnvironmentSettingId INTEGER NULL,
	NumberOfClassrooms INTEGER NULL,
	RefServiceOptionId INTEGER NULL,
	RefPopulationServedId INTEGER NULL,
	AnnualOperatingWeeks INTEGER NULL);  








CREATE TABLE ELOrganizationFunds(
	OrganizationId INTEGER NOT NULL,
	RefELFederalFundingTypeId INTEGER NULL,
	RefELLocalRevenueSourceId INTEGER NULL,
	RefELOtherFederalFundingSourcesId INTEGER NULL,
	RefELStateRevenueSourceId INTEGER NULL,
	RefBillableBasisTypeId INTEGER NULL,
	RefReimbursementTypeId INTEGER NULL);  








CREATE TABLE ELOrganizationMonitoring(
	ELOrganizationMonitoringId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	VisitStartDate date NULL,
	VisitEndDate date NULL,
	RefPurposeOfMonitoringVisitId INTEGER NULL,
	TypeOfMonitoring varchar(300) NULL,
	RefOrganizationMonitoringNotificationsId INTEGER NULL);  








CREATE TABLE ELProgramLicensing(
	ELProgramLicensingId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefELProgramLicenseStatusId INTEGER NULL,
	InitialLicenseDate date NULL,
	ContinuingLicenseDate date NULL,
	LicenseSuspensionStatus bit NULL,
	LicenseRevocationStatus bit NULL,
	NumberOfFatalities INTEGER NULL,
	NumberOfInjuries INTEGER NULL,
	RefLicenseExemptId INTEGER NULL);  








CREATE TABLE ELQualityInitiative(
	ELQualityInitiativeId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	MaximumScore varchar(30) NULL,
	MinimumScore varchar(30) NULL,
	ScoreLevel varchar(30) NULL,
	ParticipationIndicator bit NULL,
	ParticipationStartDate date NULL,
	ParticipationEndDate date NULL);  




CREATE TABLE ELQualityRatingImprovement(
	ELQualityRatingImprovementId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	NumberQrisLevels INTEGER NULL,
	QrisAwardDate date NULL,
	QRISExpirationDate date NULL,
	RefQrisParticipationId INTEGER NULL,
	QrisScore varchar(45) NULL);  








CREATE TABLE ELServicePartner(
	OrganizationId INTEGER NOT NULL,
	ServicePartnerName varchar(100) NULL,
	ServicePartnerDescription varchar(300) NULL,
	MemorandumOfUnderstandingEndDate date NULL,
	MemorandumOfUnderstandingStartDate date NULL);  








CREATE TABLE ELStaff(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefChildDevelopmentAssociateTypeId INTEGER NULL);  




CREATE TABLE ELStaffAssignment(
	OrganizationPersonRoleId INTEGER NOT NULL,
	ItinerantProvider bit NOT NULL);  

CREATE TABLE ELStaffEducation(
	OrganizationPersonRoleId INTEGER NOT NULL,
	ECDegreeOrCertificateHolder bit NULL,
	TotalCollegeCreditsEarned decimal(10, 2) NULL,
	RefELLevelOfSpecializationId INTEGER NULL,
	TotalApprovedECCreditsEarned decimal(10, 2) NULL,
	SchoolAgeEducationPSCredits decimal(10, 2) NULL,
	RefELProfessionalDevelopmentTopicAreaId INTEGER NULL);  








CREATE TABLE ELStaffEmployment(
	StaffEmploymentId INTEGER NOT NULL,
	RefEmploymentStatusId INTEGER NULL,
	HoursWorkedPerWeek decimal(5, 2) NULL,
	HourlyWage decimal(5, 2) NULL,
	RefWageCollectionMethodId INTEGER NULL,
	RefWageVerificationId INTEGER NULL,
	UnionMembershipStatus bit NULL,
	StaffApprovalIndicator bit NULL,
	RefELEducationStaffClassificationId INTEGER NULL,
	RefELEmploymentSeparationReasonId INTEGER NULL,
	RefELServiceProfessionalStaffClassificationId INTEGER NULL);  








CREATE TABLE Facility(
	LocationId INTEGER NOT NULL,
	Identifier varchar(40) NULL,
	BuildingName varchar(60) NULL,
	SpaceDescription varchar(300) NULL,
	RefSpaceUseTypeId INTEGER NULL,
	BuildingSiteNumber varchar(30) NULL,
	RefBuildingUseTypeId INTEGER NULL);  








CREATE TABLE FinancialAccount(
	FinancialAccountId SERIAL NOT NULL,
	Name varchar(100) NOT NULL,
	Description varchar(300) NULL,
	AccountNumber varchar(30) NULL,
	RefFinancialAccountCategoryId INTEGER NULL,
	RefFinancialAccountFundClassificationId INTEGER NULL,
	RefFinancialAccountProgramCodeId INTEGER NULL,
	RefFinancialAccountBalanceSheetCodeId INTEGER NULL,
	RefFinancialExpenditureFunctionCodeId INTEGER NULL,
	RefFinancialExpenditureObjectCodeId INTEGER NULL,
	FinancialAccountNumber varchar(30) NULL,
	FinancialExpenditureProjectReportingCode decimal(3, 0) NULL,
	RefFinancialExpenditureLevelOfInstructionCodeId INTEGER NULL,
	RefFinancialAccountRevenueCodeId INTEGER NULL);  








CREATE TABLE FinancialAccountProgram(
	FinancialAccountProgramId SERIAL NOT NULL,
	Name varchar(100) NULL,
	ProgramNumber varchar(30) NULL);  








CREATE TABLE FinancialAidApplication(
	FinancialAidApplicationId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefFinancialAidApplicationTypeId INTEGER NOT NULL,
	FinancialAidYearDesignator varchar(9) NULL);  








CREATE TABLE FinancialAidAward(
	FinancialAidAwardId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefFinancialAidAwardTypeId INTEGER NULL,
	RefFinancialAidStatusId INTEGER NULL,
	FinancialAidAwardAmount decimal(9, 2) NULL,
	FinancialAidYearDesignator varchar(9) NULL);  








CREATE TABLE Incident(
	IncidentId SERIAL NOT NULL,
	IncidentIdentifier varchar(40) NULL,
	IncidentDate date NULL,
	IncidentTime time(7) NULL,
	RefIncidentTimeDescriptionCodeId INTEGER NULL,
	IncidentDescription XML NULL,
	RefIncidentBehaviorId INTEGER NULL,
	RefIncidentBehaviorSecondaryId INTEGER NULL,
	RefIncidentInjuryTypeId INTEGER NULL,
	RefWeaponTypeId INTEGER NULL,
	IncidentCost varchar(30) NULL,
	OrganizationPersonRoleId INTEGER NULL,
	IncidentReporterId INTEGER NULL,
	RefIncidentReporterTypeId INTEGER NULL,
	RefIncidentLocationId INTEGER NULL,
	RefFirearmTypeId INTEGER NULL,
	RegulationViolatedDescription varchar(100) NULL,
	RelatedToDisabilityManifestationInd bit NULL,
	ReportedToLawEnforcementInd bit NULL,
	RefIncidentMultipleOffenseTypeId INTEGER NULL,
	RefIncidentPerpetratorInjuryTypeId INTEGER NULL);  








CREATE TABLE IncidentPerson(
	IncidentId INTEGER NOT NULL,
	PersonId INTEGER NOT NULL,
	Identifier varchar(40) NULL,
	RefIncidentPersonRoleTypeId INTEGER NOT NULL,
	RefIncidentPersonTypeId INTEGER NULL);  







CREATE TABLE IndividualizedProgram(
	IndividualizedProgramId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefIndividualizedProgramDateType INTEGER NULL,
	IndividualizedProgramDate date NULL,
	NonInclusionMinutesPerWeek INTEGER NULL,
	InclusionMinutesPerWeek INTEGER NULL,
	RefIndividualizedProgramTransitionTypeId INTEGER NULL,
	RefIndividualizedProgramTypeId INTEGER NULL,
	ServicePlanDate date NULL,
	RefIndividualizedProgramLocationId INTEGER NULL,
	ServicePlanMeetingParticipants varchar(4000) NULL,
	ServicePlanSignedBy varchar(4000) NULL,
	ServicePlanSignatureDate date NULL,
	ServicePlanReevaluationDate date NULL,
	RefStudentSupportServiceTypeId INTEGER NULL);  








CREATE TABLE IndividualizedProgramService(
	IndividualizedProgramServiceId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	RefIndividualizedProgramPlannedServiceTypeId INTEGER NULL,
	RefMethodOfServiceDeliveryId INTEGER NULL,
	RefServiceFrequencyId INTEGER NULL,
	PlannedServiceDuration decimal(6, 2) NULL,
	PlannedServiceStartDate date NULL);  








CREATE TABLE K12Course(
	OrganizationId INTEGER NOT NULL,
	HighSchoolCourseRequirement bit NULL,
	RefAdditionalCreditTypeId INTEGER NULL,
	AvailableCarnegieUnitCredit decimal(9, 2) NULL,
	RefCourseGpaApplicabilityId INTEGER NULL,
	CoreAcademicCourse bit NULL,
	RefCurriculumFrameworkTypeId INTEGER NULL,
	CourseAlignedWithStandards bit NULL,
	RefCreditTypeEarnedId INTEGER NOT NULL,
	FundingProgram varchar(30) NULL,
	FamilyConsumerSciencesCourseInd bit NULL,
	SCEDCourseCode varchar(5) NULL,
	SCEDGradeSpan varchar(4) NULL,
	RefSCEDCourseLevelId INTEGER NULL,
	RefSCEDCourseSubjectAreaId INTEGER NULL,
	RefCareerClusterId INTEGER NULL,
	RefBlendedLearningModelTypeId INTEGER NULL,
	RefCourseInteractionModeId INTEGER NULL,
	RefK12EndOfCourseRequirementId INTEGER NULL,
	RefWorkbasedLearningOpportunityTypeId INTEGER NULL,
	CourseDepartmentName varchar(60) NULL);  








CREATE TABLE K12Lea(
	OrganizationId INTEGER NOT NULL,
	RefLeaTypeId INTEGER NULL,
	SupervisoryUnionIdentificationNumber varchar(3) NULL,
	RefLEAImprovementStatusId INTEGER NULL,
	RefPublicSchoolChoiceStatusId INTEGER NULL);  








CREATE TABLE K12LeaFederalFunds(
	OrganizationId INTEGER NOT NULL,
	FederalProgramsFundingAllocation numeric(12, 2) NULL,
	RefFederalProgramFundingAllocationTypeId INTEGER NULL,
	FundsTransferAmount numeric(12, 2) NULL,
	InnovativeProgramsFundsReceived numeric(12, 2) NULL,
	InnovativeDollarsSpent numeric(12, 2) NULL,
	InnovativeDollarsSpentOnStrategicPriorities numeric(12, 2) NULL,
	LeaTransferabilityOfFunds bit NULL,
	RefLeaFundsTransferTypeId INTEGER NULL,
	PublicSchoolChoiceFundsSpent numeric(12, 2) NULL,
	SchoolImprovementReservedPercent numeric(5, 2) NULL,
	SchoolImprovementAllocation numeric(12, 2) NULL,
	SesFundsSpent numeric(12, 2) NULL,
	SesPerPupilExpenditure numeric(12, 2) NULL,
	SesSchoolChoice20PercentObligation numeric(12, 2) NULL,
	RefRlisProgramUseId INTEGER NULL,
	RefReapAlternativeFundingStatusId INTEGER NULL,
	NumberOfImmigrantProgramSubgrants INTEGER NULL);  








CREATE TABLE K12LeaFederalReporting(
	OrganizationId INTEGER NOT NULL,
	RefBarrierToEducatingHomelessId INTEGER NULL,
	DesegregationOrderOrPlan bit NULL,
	HarassmentOrBullyingPolicy bit NULL,
	RefIntegratedTechnologyStatusId INTEGER NULL,
	StateAssessmentAdminFunding numeric(5, 2) NULL,
	StateAssessStandardsFunding numeric(5, 2) NULL,
	TerminatedTitleIIIProgramFailure bit NULL,
	InterscholasticSportsMaleOnly INTEGER NULL,
	InterscholasticSportsFemaleOnly INTEGER NULL,
	InterscholasticTeamsMaleOnly INTEGER NULL,
	InterscholasticTeamsFemaleOnly INTEGER NULL,
	InterscholasticSportParticipantsMale INTEGER NULL,
	InterscholasticSportParticipantsFemale INTEGER NULL);  








CREATE TABLE K12LeaPreKEligibility(
	K12LEAPreKEligibilityId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefPrekindergartenEligibilityId INTEGER NOT NULL);    








CREATE TABLE K12LeaPreKEligibleAgesIDEA(
	K12LEAPreKEligibleAgesIDEAId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefPreKEligibleAgesNonIDEAId INTEGER NOT NULL);  








CREATE TABLE K12LeaSafeDrugFree(
	OrganizationId INTEGER NOT NULL,
	Baseline varchar(60) NULL,
	BaselineYear varchar(20) NULL,
	CollectionFrequency varchar(60) NULL,
	IndicatorName varchar(60) NULL,
	Instrument varchar(100) NULL,
	Performance varchar(20) NULL,
	Target varchar(20) NULL,
	MostRecentCollection varchar(20) NULL);  








CREATE TABLE K12LeaTitleIIIProfessionalDevelopment(
	K12LEATitleIIIProfessionalDevelopmentId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefTitleIIIProfessionalDevelopmentTypeId INTEGER NOT NULL);    








CREATE TABLE K12LeaTitleISupportService(
	K12LeaTitleISupportServiceId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefK12LeaTitleISupportServiceId INTEGER NOT NULL);  








CREATE TABLE K12OrganizationStudentResponsibility(
	K12OrganizationStudentResponsibilityId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefK12ResponsibilityTypeId INTEGER NOT NULL);    








CREATE TABLE K12ProgramOrService(
	OrganizationId INTEGER NOT NULL,
	RefPrekindergartenDailyLengthId INTEGER NULL,
	RefKindergartenDailyLengthId INTEGER NULL,
	RefProgramGiftedEligibilityId INTEGER NULL,
	RefMepSessionTypeId INTEGER NULL,
	RefMepProjectTypeId INTEGER NULL,
	ProgramInMultiplePurposeFacility bit NULL,
	RefTitleIInstructionalServicesId INTEGER NULL,
	RefTitleIProgramTypeId INTEGER NULL);  








CREATE TABLE K12School(
	OrganizationId INTEGER NOT NULL,
	RefSchoolTypeId INTEGER NULL,
	RefSchoolLevelId INTEGER NULL,
	RefAdministrativeFundingControlId INTEGER NULL,
	CharterSchoolIndicator bit NULL,
	RefCharterSchoolTypeId INTEGER NULL,
	RefIncreasedLearningTimeTypeId INTEGER NULL,
	RefStatePovertyDesignationId INTEGER NULL,
	CharterSchoolApprovalYear varchar(9) NULL,
	RefCharterSchoolApprovalAgencyTypeId INTEGER NULL,
	AccreditationAgencyName varchar(300) NULL,
	CharterSchoolOpenEnrollmentIndicator bit NULL,
	CharterSchoolContractApprovalDate date NULL,
	CharterSchoolContractIdNumber varchar(30) NULL,
	CharterSchoolContractRenewalDate date NULL,
	RefCharterSchoolManagementOrganizationTypeId INTEGER NULL);  








CREATE TABLE K12SchoolCorrectiveAction(
	K12SchoolCorrectiveActionId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefCorrectiveActionTypeId INTEGER NOT NULL);  








CREATE TABLE K12SchoolGradeOffered(
	K12SchoolGradeOfferedId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefGradeLevelId INTEGER NOT NULL);  








CREATE TABLE K12SchoolImprovement(
	K12SchoolImprovementId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefSchoolImprovementStatusId INTEGER NULL,
	RefSchoolImprovementFundsId INTEGER NULL,
	RefSigInterventionTypeId INTEGER NULL,
	SchoolImprovementExitDate date NULL);  








CREATE TABLE K12SchoolStatus(
	OrganizationId INTEGER NOT NULL,
	RefMagnetSpecialProgramId INTEGER NULL,
	RefAlternativeSchoolFocusId INTEGER NULL,
	RefInternetAccessId INTEGER NULL,
	RefRestructuringActionId INTEGER NULL,
	RefTitleISchoolStatusId INTEGER NULL,
	ConsolidatedMepFundsStatus bit NULL);  






CREATE TABLE K12Sea(
	OrganizationId INTEGER NOT NULL,
	RefStateANSICode char(2) NULL);  









CREATE TABLE K12SeaAlternateFundUse(
	K12SEAlternateFundUseId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefAlternateFundUsesId INTEGER NOT NULL);    








CREATE TABLE K12SeaFederalFundAllocation(
	K12SEAFederalFundAllocationId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	FederalProgramCode varchar(10) NOT NULL,
	RefFederalProgramFundingAllocationTypeId INTEGER NULL,
	FederalProgramsFundingAllocation numeric(18, 2) NULL);  








CREATE TABLE K12SeaFederalFunds(
	OrganizationId INTEGER NOT NULL,
	StateTransferabilityOfFunds bit NULL,
	DateStateReceivedTitleIIIAllocation date NULL,
	DateTitleIIIFundsAvailableToSubgrantees date NULL,
	NumberOfDaysForTitleIIISubgrants numeric(6, 2) NULL);  








CREATE TABLE K12StaffAssignment(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefK12StaffClassificationId INTEGER NULL,
	RefProfessionalEducationJobClassificationId INTEGER NULL,
	RefTeachingAssignmentRoleId INTEGER NULL,
	PrimaryAssignment bit NULL,
	TeacherOfRecord bit NULL,
	RefClassroomPositionTypeId INTEGER NULL,
	FullTimeEquivalency decimal(5, 4) NULL,
	ContributionPercentage decimal(5, 2) NULL,
	ItinerantTeacher bit NULL,
	HighlyQualifiedTeacherIndicator bit NULL,
	SpecialEducationTeacher bit NULL,
	RefSpecialEducationStaffCategoryId INTEGER NULL,
	SpecialEducationRelatedServicesPersonnel bit NULL,
	SpecialEducationParaprofessional bit NULL,
	RefSpecialEducationAgeGroupTaughtId INTEGER NULL,
	RefMepStaffCategoryId INTEGER NULL,
	RefTitleIProgramStaffCategoryId INTEGER NULL);  








CREATE TABLE K12StaffEmployment(
	StaffEmploymentId INTEGER NOT NULL,
	RefK12StaffClassificationId INTEGER NULL,
	RefEmploymentStatusId INTEGER NULL,
	ContractDaysOfServicePerYear decimal(5, 2) NULL,
	StaffCompensationBaseSalary decimal(9, 2) NULL,
	StaffCompensationRetirementBenefits decimal(9, 2) NULL,
	StaffCompensationHealthBenefits decimal(9, 2) NULL,
	StaffCompensationOtherBenefits decimal(9, 2) NULL,
	StaffCompensationTotalBenefits decimal(9, 2) NULL,
	StaffCompensationTotalSalary decimal(9, 2) NULL,
	MepPersonnelIndicator bit NULL,
	TitleITargetedAssistanceStaffFunded bit NULL,
	SalaryForTeachingAssignmentOnlyIndicator bit NULL);  








CREATE TABLE K12StudentAcademicHonor(
	K12StudentAcademicHonorId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefAcademicHonorTypeId INTEGER NULL,
	HonorDescription varchar(80) NULL);  








CREATE TABLE K12StudentAcademicRecord(
	OrganizationPersonRoleId INTEGER NOT NULL,
	CreditsAttemptedCumulative decimal(9, 2) NULL,
	CreditsEarnedCumulative decimal(9, 2) NULL,
	GradePointsEarnedCumulative decimal(9, 2) NULL,
	GradePointAverageCumulative decimal(9, 4) NULL,
	RefGpaWeightedIndicatorId INTEGER NULL,
	ProjectedGraduationDate varchar(7) NULL,
	HighSchoolStudentClassRank INTEGER NULL,
	ClassRankingDate varchar(10) NULL,
	TotalNumberInClass INTEGER NULL,
	DiplomaOrCredentialAwardDate varchar(7) NULL,
	RefHighSchoolDiplomaTypeId INTEGER NULL,
	RefHighSchoolDiplomaDistinctionTypeId INTEGER NULL,
	RefTechnologyLiteracyStatusId INTEGER NULL,
	RefPsEnrollmentActionId INTEGER NULL,
	RefPreAndPostTestIndicatorId INTEGER NULL,
	RefProfessionalTechnicalCredentialTypeId INTEGER NULL,
	RefProgressLevelId INTEGER NULL);  








CREATE TABLE K12StudentActivity(
	OrganizationPersonRoleId INTEGER NOT NULL,
	ActivityTimeInvolved decimal(9, 2) NULL,
	RefActivityTimeMeasurementTypeId INTEGER NULL);  








CREATE TABLE K12StudentCohort(
	OrganizationPersonRoleId INTEGER NOT NULL,
	CohortYear varchar(4) NULL,
	CohortGraduationYear varchar(4) NULL,
	GraduationRateSurveyCohortYear varchar(4) NULL,
	GraduationRateSurveyIndicator bit NULL,
	CohortDescription varchar(30) NULL);  








CREATE TABLE K12StudentCourseSection(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefCourseRepeatCodeId INTEGER NULL,
	RefCourseSectionEnrollmentStatusTypeId INTEGER NULL,
	RefCourseSectionEntryTypeId INTEGER NULL,
	RefCourseSectionExitTypeId INTEGER NULL,
	RefExitOrWithdrawalStatusId INTEGER NULL,
	RefGradeLevelWhenCourseTakenId INTEGER NULL,
	GradeEarned varchar(15) NULL,
	GradeValueQualifier varchar(100) NULL,
	NumberOfCreditsAttempted decimal(9, 2) NULL,
	RefCreditTypeEarnedId INTEGER NULL,
	RefAdditionalCreditTypeId INTEGER NULL,
	RefPreAndPostTestIndicatorId INTEGER NULL,
	RefProgressLevelId INTEGER NULL,
	RefCourseGpaApplicabilityId INTEGER NULL,
	NumberOfCreditsEarned decimal(9, 2) NULL,
	TuitionFunded bit NULL);  








CREATE TABLE K12StudentCourseSectionMark(
	K12StudentCourseSectionMarkId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	MarkingPeriodName varchar(30) NULL,
	FinalIndicator bit NULL,
	GradeEarned varchar(15) NULL,
	MidTermMark varchar(15) NULL,
	GradeValueQualifier varchar(100) NULL,
	StudentCourseSectionGradeNarrative varchar(300) NULL);  








CREATE TABLE K12StudentDiscipline(
	K12StudentDisciplineId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefDisciplineReasonId INTEGER NULL,
	RefDisciplinaryActionTakenId INTEGER NULL,
	DisciplinaryActionStartDate date NULL,
	DisciplinaryActionEndDate date NULL,
	DurationOfDisciplinaryAction decimal(9, 2) NULL,
	RefDisciplineLengthDifferenceReasonId INTEGER NULL,
	FullYearExpulsion bit NULL,
	ShortenedExpulsion bit NULL,
	EducationalServicesAfterRemoval bit NULL,
	RefIdeaInterimRemovalId INTEGER NULL,
	RefIdeaInterimRemovalReasonId INTEGER NULL,
	RelatedToZeroTolerancePolicy bit NULL,
	IncidentId INTEGER NULL,
	IEPPlacementMeetingIndicator bit NULL,
	RefDisciplineMethodFirearmsId INTEGER NULL,
	RefDisciplineMethodOfCwdId INTEGER NULL,
	RefIDEADisciplineMethodFirearmId INTEGER NULL);  








CREATE TABLE K12StudentEmployment(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefEmployedWhileEnrolledId INTEGER NULL,
	RefEmployedAfterExitId INTEGER NULL,
	EmploymentNaicsCode varchar(6) NULL);  








CREATE TABLE K12StudentEnrollment(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefEntryGradeLevelId INTEGER NULL,
	RefPublicSchoolResidence INTEGER NULL,
	RefEnrollmentStatusId INTEGER NULL,
	RefEntryType INTEGER NULL,
	RefExitGradeLevel INTEGER NULL,
	RefExitOrWithdrawalStatusId INTEGER NULL,
	RefExitOrWithdrawalTypeId INTEGER NULL,
	DisplacedStudentStatus bit NULL,
	RefEndOfTermStatusId INTEGER NULL,
	RefPromotionReasonId INTEGER NULL,
	RefNonPromotionReasonId INTEGER NULL,
	RefFoodServiceEligibilityId INTEGER NULL,
	FirstEntryDateIntoUSSchool date NULL,
	RefDirectoryInformationBlockStatusId INTEGER NULL,
	NSLPDirectCertificationIndicator bit NULL);  

CREATE TABLE LearningStandardItem(
	LearningStandardItemId SERIAL NOT NULL,
	Identifier varchar(40) NULL,
	Code varchar(30) NULL,
	URL varchar(300) NULL,
	Type varchar(60) NULL,
	Statement XML NULL,
	Version XML NULL,
	TypicalAgeRange varchar(20) NULL,
	RefLanguageId INTEGER NULL,
	TextComplexitySystem varchar(30) NULL,
	TextComplexityMinimumValue decimal(18, 4) NULL,
	TextComplexityMaximumValue decimal(18, 4) NULL,
	RefBloomsTaxonomyDomainId INTEGER NULL,
	RefMultipleIntelligenceTypeId INTEGER NULL,
	ConceptTerm varchar(30) NULL,
	ConceptKeyword varchar(300) NULL,
	License varchar(300) NULL,
	Notes XML NULL,
	LearningStandardItemParentId varchar(40) NULL,
	LearningStandardItemParentCode varchar(30) NULL,
	LearningStandardItemParentURL varchar(300) NULL,
	ChildOf_LearningStandardItem INTEGER NULL,
	LearningStandardDocumentId INTEGER NOT NULL,
	CurrentVersionIndicator bit NULL,
	PreviousVersionIdentifier varchar(40) NULL,
	ValidStartDate date NULL,
	ValidEndDate date NULL,
	NodeName varchar(30) NULL,
	RefLearningStandardItemNodeAccessibilityProfileId INTEGER NULL,
	RefLearningStandardItemTestabilityTypeId INTEGER NULL,
	LearningStandardItemSequence varchar(60) NULL);  








CREATE TABLE LearningStandardItemAssociation(
	LearningStandardItemAssociationId SERIAL NOT NULL,
	LearningStandardItemId INTEGER NOT NULL,
	RefEntityTypeId INTEGER NOT NULL,
	AssociatedEntityId INTEGER NOT NULL,
	RefLearningStandardItemAssociationTypeId INTEGER NULL,
	LearningStandardItemAssociationIdentifierURI varchar(300) NULL,
	ConnectionCitation varchar(300) NULL,
	OriginNodeName varchar(30) NULL,
	OriginNodeURI varchar(300) NULL,
	DestinationNodeName varchar(30) NULL,
	DestinationNodeURI varchar(300) NULL,
	Weight decimal(9, 3) NULL);  








CREATE TABLE LearningStandardItemEducationLevel(
	LearningStandardItemEducationLevelId SERIAL NOT NULL,
	LearningStandardsItemId INTEGER NOT NULL,
	RefEducationLevelId INTEGER NOT NULL);    








CREATE TABLE Location(
	LocationId SERIAL NOT NULL);  








CREATE TABLE LocationAddress(
	LocationId INTEGER NOT NULL,
	StreetNumberAndName varchar(40) NULL,
	ApartmentRoomOrSuiteNumber varchar(30) NULL,
	BuildingSiteNumber varchar(30) NULL,
	City varchar(30) NULL,
	RefStateId INTEGER NULL,
	PostalCode varchar(17) NULL,
	CountyName varchar(30) NULL,
	RefCountyId INTEGER NULL,
	RefCountryId INTEGER NULL,
	Latitude varchar(20) NULL,
	Longitude varchar(20) NULL,
	RefERSRuralUrbanContinuumCodeId INTEGER NULL);  




CREATE TABLE Organization(
	OrganizationId SERIAL NOT NULL,
	Name varchar(60) NULL,
	RefOrganizationTypeId INTEGER NULL,
	ShortName varchar(30) NULL);  


CREATE TABLE OrganizationAccreditation(
	OrganizationAccreditationId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	AccreditationStatus bit NULL,
	RefAccreditationAgencyId INTEGER NULL,
	AccreditationAwardDate date NULL,
	AccreditationExpirationDate date NULL,
	SeekingAccreditationDate date NULL);  

CREATE TABLE OrganizationCalendar(
	OrganizationCalendarId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	CalendarCode varchar(30) NULL,
	CalendarDescription varchar(60) NOT NULL,
	CalendarYear varchar(4) NULL);  


CREATE TABLE OrganizationCalendarCrisis(
	OrganizationCalendarCrisisId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	Code varchar(30) NULL,
	Name varchar(50) NULL,
	StartDate date NULL,
	EndDate date NULL,
	Type varchar(50) NULL,
	CrisisDescription varchar(300) NULL,
	CrisisEndDate date NULL);  


CREATE TABLE OrganizationCalendarDay(
	OrganizationCalendarDayId SERIAL NOT NULL,
	OrganizationCalendarId INTEGER NOT NULL,
	DayName varchar(30) NOT NULL,
	AlternateDayName varchar(30) NULL);  
CREATE TABLE OrganizationCalendarEvent(
	OrganizationCalendarEventId SERIAL NOT NULL,
	OrganizationCalendarId INTEGER NOT NULL,
	Name varchar(30) NOT NULL,
	EventDate date NOT NULL,
	RefCalendarEventType INTEGER NULL);  


CREATE TABLE OrganizationCalendarSession(
	OrganizationCalendarSessionId SERIAL NOT NULL,
	Designator varchar(7) NULL,
	BeginDate date NULL,
	EndDate date NULL,
	RefSessionTypeId INTEGER NULL,
	InstructionalMinutes numeric(18, 0) NULL,
	Code varchar(30) NULL,
	Description XML NULL,
	MarkingTermIndicator bit NULL,
	SchedulingTermIndicator bit NULL,
	AttendanceTermIndicator bit NULL,
	OrganizationCalendarId INTEGER NULL,
	DaysInSession INTEGER NULL,
	FirstInstructionDate date NULL,
	LastInstructionDate date NULL,
	MinutesPerDay INTEGER NULL,
	SessionStartTime time(7) NULL,
	SessionEndTime time(7) NULL);  

CREATE TABLE OrganizationEmail(
	OrganizationEmailId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	ElectronicMailAddress varchar(128) NULL,
	RefEmailTypeId INTEGER NULL);  


CREATE TABLE OrganizationFederalAccountability(
	OrganizationFederalAccountabilityId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefAypStatusId INTEGER NULL,
	AlternateAypApproachIndicator bit NULL,
	AypAppealChangedDesignation bit NULL,
	AypAppealProcessDate date NULL,
	AypAppealProcessDesignation bit NULL,
	AmaoAypProgressAttainmentLepStudents INTEGER NULL,
	AmaoProficiencyAttainmentLepStudents INTEGER NULL,
	AmaoProgressAttainmentLepStudents INTEGER NULL,
	RefGunFreeSchoolsActStatusReportingId INTEGER NULL,
	RefHighSchoolGraduationRateIndicator INTEGER NULL,
	RefParticipationStatusMathId INTEGER NULL,
	RefParticipationStatusRlaId INTEGER NULL,
	RefProficiencyTargetStatusMathId INTEGER NULL,
	RefProficiencyTargetStatusRLAId INTEGER NULL,
	PersistentlyDangerousStatus bit NULL,
	RefReconstitutedStatusId INTEGER NULL,
	RefElementaryMiddleAdditionalId INTEGER NULL,
	AccountabilityReportTitle varchar(80) NULL,
	RefCteGraduationRateInclusionId INTEGER NULL);  



CREATE TABLE OrganizationFinancial(
	OrganizationFinancialId SERIAL NOT NULL,
	FinancialAccountId INTEGER NOT NULL,
	OrganizationCalendarSessionId INTEGER NOT NULL,
	ActualValue decimal(12, 2) NULL,
	BudgetedValue decimal(12, 1) NULL,
	Date date NULL,
	EncumberedValue decimal(9, 2) NULL,
	Value decimal(9, 2) NULL,
	FiscalPeriodBeginDate date NULL,
	FiscalPeriodEndDate date NULL,
	FiscalYear varchar(4) NULL,
	FinancialAccountProgramId INTEGER NULL);  








CREATE TABLE OrganizationIdentifier(
	OrganizationIdentifierId SERIAL NOT NULL,
	Identifier varchar(40) NULL,
	RefOrganizationIdentificationSystemId INTEGER NULL,
	OrganizationId INTEGER NOT NULL,
	RefOrganizationIdentifierTypeId INTEGER NULL);  








CREATE TABLE OrganizationIndicator(
	OrganizationIndicatorId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	IndicatorValue varchar(50) NOT NULL,
	RefOrganizationIndicatorId INTEGER NOT NULL);  








CREATE TABLE OrganizationLocation(
	OrganizationLocationId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	LocationId INTEGER NOT NULL,
	RefOrganizationLocationTypeId INTEGER NULL);  








CREATE TABLE OrganizationOperationalStatus(
	OrganizationOperationalStatusId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefOperationalStatusId INTEGER NOT NULL,
	OperationalStatusEffectiveDate date NULL);  








CREATE TABLE OrganizationPersonRole(
	OrganizationPersonRoleId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	PersonId INTEGER NOT NULL,
	RoleId INTEGER NOT NULL,
	EntryDate timestamp NULL,
	ExitDate timestamp NULL);  








CREATE TABLE OrganizationPolicy(
	OrganizationPolicyId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	PolicyType varchar(100) NOT NULL,
	Value varchar(100) NOT NULL);  








CREATE TABLE OrganizationProgramType(
	OrganizationProgramTypeId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefProgramTypeId INTEGER NOT NULL);  








CREATE TABLE OrganizationRelationship(
	OrganizationRelationshipId SERIAL NOT NULL,
	Parent_OrganizationId INTEGER NOT NULL,
	OrganizationId INTEGER NULL,
	RefOrganizationRelationshipId INTEGER NOT NULL);  








CREATE TABLE OrganizationTechnicalAssistance(
	OrganizationTechnicalAssistanceId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefTechnicalAssistanceTypeId INTEGER NULL,
	RefTechnicalAssistanceDeliveryTypeId INTEGER NULL,
	TechnicalAssistanceApprovedInd bit NULL);  



CREATE TABLE OrganizationTelephone(
	OrganizationTelephoneId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	TelephoneNumber varchar(24) NOT NULL,
	PrimaryTelephoneNumberIndicator bit NOT NULL,
	RefInstitutionTelephoneTypeId INTEGER NULL);  








CREATE TABLE OrganizationWebsite(
	OrganizationId INTEGER NOT NULL,
	Website varchar(300) NULL);  








CREATE TABLE PDActivityEducationLevel(
	PDActivityEducationLevelId SERIAL NOT NULL,
	ProfessionalDevelopmentActivityId INTEGER NOT NULL,
	RefPDActivityEducationLevelsAddressedId INTEGER NOT NULL); 




CREATE TABLE PeerRatingSystem(
	PeerRatingSystemId SERIAL NOT NULL,
	Name varchar(60) NOT NULL,
	MaximumValue numeric(18, 4) NULL,
	MinimumValue numeric(18, 4) NOT NULL,
	OptimumValue numeric(18, 4) NULL);  








CREATE TABLE Person(
	PersonId SERIAL NOT NULL,
	FirstName varchar(35) NULL,
	MiddleName varchar(35) NULL,
	LastName varchar(35) NOT NULL,
	GenerationCode varchar(10) NULL,
	Prefix varchar(30) NULL,
	Birthdate date NULL,
	RefSexId INTEGER NULL,
	HispanicLatinoEthnicity bit NULL,
	RefUSCitizenshipStatusId INTEGER NULL,
	RefVisaTypeId INTEGER NULL,
	RefStateOfResidenceId INTEGER NULL,
	RefProofOfResidencyTypeId INTEGER NULL,
	RefHighestEducationLevelCompletedId INTEGER NULL,
	RefPersonalInformationVerificationId INTEGER NULL,
	BirthdateVerification varchar(60) NULL,
	RefTribalAffiliationId INTEGER NULL);  








CREATE TABLE Person_AssessmentPersonalNeedsProfile(
	Person_AssessmentPersonalNeedsProfileId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	AssessmentPersonalNeedsProfileId INTEGER NOT NULL);    



CREATE TABLE PersonAddress(
	PersonAddressId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	RefPersonLocationTypeId INTEGER NOT NULL,
	StreetNumberAndName varchar(40) NULL,
	ApartmentRoomOrSuiteNumber varchar(30) NULL,
	City varchar(30) NULL,
	RefStateId INTEGER NULL,
	PostalCode varchar(17) NULL,
	AddressCountyName varchar(30) NULL,
	RefCountyId INTEGER NULL,
	RefCountryId INTEGER NULL,
	Latitude varchar(20) NULL,
	Longitude varchar(20) NULL,
	RefPersonalInformationVerificationId INTEGER NULL);  








CREATE TABLE PersonAllergy(
	PersonAllergyId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	RefAllergyTypeId INTEGER NOT NULL,
	RefAllergySeverityId INTEGER NULL,
	ReactionDescription varchar(2000) NULL);  








CREATE TABLE PersonBirthplace(
	PersonId INTEGER NOT NULL,
	City varchar(30) NULL,
	RefStateId INTEGER NULL,
	RefCountryId INTEGER NULL);  








CREATE TABLE PersonCareerEducationPlan(
	PersonCareerEducationPlanId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	LastUpdated date NULL,
	RefCareerEducationPlanTypeId INTEGER NULL,
	ProfessionalDevelopmentPlanApprovedBySupervisor bit NULL,
	ProfessionalDevelopmentPlanCompletion date NULL,
	TuitionFunded bit NULL);  








CREATE TABLE PersonCredential(
	PersonCredentialId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	CredentialName varchar(60) NULL,
	RefCredentialTypeId INTEGER NULL,
	IssuanceDate date NULL,
	ExpirationDate date NULL,
	RefIssuingStateId INTEGER NULL,
	ProfessionalCertificateOrLicenseNumber varchar(30) NULL,
	CredentialOrLicenseAwardEntity varchar(60) NULL);  








CREATE TABLE PersonDegreeOrCertificate(
	PersonDegreeOrCertificateId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	DegreeOrCertificateTitleOrSubject varchar(45) NULL,
	RefDegreeOrCertificateTypeId INTEGER NULL,
	AwardDate date NULL,
	NameOfInstitution varchar(60) NULL,
	RefHigherEducationInstitutionAccreditationStatusId INTEGER NULL,
	RefEducationVerificationMethodId INTEGER NULL);  








CREATE TABLE PersonDemographicRace(
	PersonDemographicRaceId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	RefRaceId INTEGER NOT NULL);  








CREATE TABLE PersonDisability(
	PersonId INTEGER NOT NULL,
	PrimaryDisabilityTypeId INTEGER NULL,
	DisabilityStatus bit NULL,
	RefAccommodationsNeededTypeId INTEGER NULL,
	RefDisabilityConditionTypeId INTEGER NULL,
	RefDisabilityDeterminationSourceTypeId INTEGER NULL,
	RefDisabilityConditionStatusCodeId INTEGER NULL);  








CREATE TABLE PersonEmailAddress(
	PersonEmailAddressId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	EmailAddress varchar(128) NULL,
	RefEmailTypeId INTEGER NULL);  








CREATE TABLE PersonFamily(
	PersonFamilyId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	FamilyIdentifier varchar(40) NULL,
	NumberOfPeopleInFamily INTEGER NULL,
	NumberOfPeopleInHousehold INTEGER NULL,
	FamilyIncome decimal(10, 2) NULL,
	RefFamilyIncomeSourceId INTEGER NULL,
	RefIncomeCalculationMethodId INTEGER NULL,
	RefProofOfResidencyTypeId INTEGER NULL,
	RefELProgramEligibilityId INTEGER NULL,
	RefHighestEducationLevelCompletedId INTEGER NULL,
	RefCommunicationMethodId INTEGER NULL,
	IncludedInCountedFamilySize bit NULL);  








CREATE TABLE PersonHealth(
	PersonHealthId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	VisionScreeningDate date NULL,
	RefVisionScreeningStatusId INTEGER NULL,
	HearingScreeningDate date NULL,
	RefHearingScreeningStatusId INTEGER NULL,
	DentalScreeningDate date NOT NULL,
	RefDentalScreeningStatusId INTEGER NULL,
	RefHealthInsuranceCoverageId INTEGER NULL,
	RefDentalInsuranceCoverageTypeId INTEGER NULL,
	RefMedicalAlertIndicatorId INTEGER NULL,
	HealthScreeningEquipmentUsed varchar(300) NULL,
	HealthScreeningFollowUpRecommendation XML NULL);  








CREATE TABLE PersonHealthBirth(
	PersonId INTEGER NOT NULL,
	WeeksOfGestation INTEGER NULL,
	MultipleBirthIndicator bit NULL,
	WeightAtBirth varchar(20) NULL,
	RefTrimesterWhenPrenatalCareBeganId INTEGER NULL);  








CREATE TABLE PersonHomelessness(
	PersonId INTEGER NOT NULL,
	HomelessnessStatus bit NOT NULL,
	RefHomelessNighttimeResidenceId INTEGER NOT NULL);  








CREATE TABLE PersonIdentifier(
	PersonIdentifierId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	Identifier varchar(40) NULL,
	RefPersonIdentificationSystemId INTEGER NOT NULL,
	RefPersonalInformationVerificationId INTEGER NULL);  








CREATE TABLE PersonImmunization(
	PersonImmunizationId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	ImmunizationDate date NOT NULL,
	RefImmunizationTypeId INTEGER NOT NULL);  








CREATE TABLE PersonLanguage(
	PersonLanguageId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	RefLanguageId INTEGER NOT NULL,
	RefLanguageUseTypeId INTEGER NOT NULL);  








CREATE TABLE PersonMilitary(
	PersonId INTEGER NOT NULL,
	RefMilitaryActiveStudentIndicatorId INTEGER NULL,
	RefMilitaryConnectedStudentIndicatorId INTEGER NULL,
	RefMilitaryVeteranStudentIndicatorId INTEGER NULL,
	RefMilitaryBranchId INTEGER NULL);  








CREATE TABLE PersonOtherName(
	PersonOtherNameId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	RefOtherNameTypeId INTEGER NULL,
	OtherName varchar(40) NULL,
	FirstName varchar(35) NULL,
	MiddleName varchar(35) NULL,
	LastName varchar(35) NULL);  








CREATE TABLE PersonProgramParticipation(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefParticipationTypeId INTEGER NULL,
	RefProgramExitReasonId INTEGER NULL);  








CREATE TABLE PersonReferral(
	PersonReferralId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	ReferralDate date NULL,
	Reason XML NULL,
	Source varchar(60) NULL,
	ReferralTypeReceived varchar(60) NULL,
	ReferredTo varchar(60) NULL,
	RefReferralOutcomeId INTEGER NULL);  








CREATE TABLE PersonRelationship(
	PersonRelationshipId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	RelatedPersonId INTEGER NOT NULL,
	RefPersonRelationshipId INTEGER NULL,
	CustodialRelationshipIndicator bit NULL,
	EmergencyContactInd bit NULL,
	ContactPriorityNumber INTEGER NULL,
	ContactRestrictions varchar(2000) NULL,
	LivesWithIndicator bit NULL,
	PrimaryContactIndicator bit NULL);  








CREATE TABLE PersonStatus(
	PersonStatusId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	RefPersonStatusTypeId INTEGER NOT NULL,
	StatusValue bit NOT NULL,
	StatusStartDate date NULL,
	StatusEndDate date NULL);  








CREATE TABLE PersonTelephone(
	PersonTelephoneId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	TelephoneNumber varchar(24) NULL,
	PrimaryTelephoneNumberIndicator bit NOT NULL,
	RefPersonTelephoneNumberTypeId INTEGER NULL);  








CREATE TABLE ProfessionalDevelopmentActivity(
	ProfessionalDevelopmentActivityId SERIAL NOT NULL,
	CourseId INTEGER NULL,
	ProfessionalDevelopmentRequirementId INTEGER NOT NULL,
	Title varchar(50) NULL,
	ActivityIdentifier varchar(40) NULL,
	Description varchar(2000) NULL,
	Objective varchar(2000) NULL,
	ActivityCode varchar(30) NULL,
	ApprovalCode varchar(30) NULL,
	Cost decimal(6, 2) NULL,
	Credits decimal(6, 2) NULL,
	RefCourseCreditUnitId INTEGER NULL,
	ScholarshipStatus bit NULL,
	RefProfessionalDevelopmentFinancialSupportId INTEGER NULL,
	PublishIndicator bit NULL,
	RefPDAudienceTypeId INTEGER NULL,
	RefPDActivityApprovedPurposeId INTEGER NULL,
	RefPDActivityCreditTypeId INTEGER NULL,
	RefPDActivityLevelId INTEGER NULL,
	RefPDActivityTypeId INTEGER NULL,
	ProfessionalDevelopmentActivityStateApprovedStatus bit NULL);  











CREATE TABLE ProfessionalDevelopmentRequirement(
	ProfessionalDevelopmentRequirementId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RequiredTrainingClockHours decimal(6, 2) NULL,
	CompetencySetId INTEGER NULL);  








CREATE TABLE ProfessionalDevelopmentSession(
	ProfessionalDevelopmentSessionId SERIAL NOT NULL,
	ProfessionalDevelopmentActivityId INTEGER NOT NULL,
	SessionIdentifier varchar(40) NULL,
	RefPDDeliveryMethodId INTEGER NULL,
	Capacity INTEGER NULL,
	StartDate date NULL,
	StartTime varchar(15) NULL,
	EndDate date NULL,
	EndTime varchar(15) NULL,
	LocationName varchar(60) NULL,
	EvaluationMethod varchar(30) NULL,
	EvaluationScore varchar(30) NULL,
	ExpirationDate date NULL,
	RefPDSessionStatusId INTEGER NULL,
	RefPDInstructionalDeliveryModeId INTEGER NULL,
	SponsoringAgencyName varchar(60) NULL,
	RefLanguageId INTEGER NULL,
	FundingSource varchar(30) NULL,
	TrainingAndTechnicalAssistanceLevel varchar(100) NULL,
	RefELTrainerCoreKnowledgeAreaId INTEGER NULL);  








CREATE TABLE ProfessionalDevelopmentSessionInstructor(
	ProfessionalDevelopmentSessionInstructorId SERIAL NOT NULL,
	ProfessionalDevelopmentSessionId INTEGER NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL);  
 







CREATE TABLE Program(
	OrganizationId INTEGER NOT NULL,
	CreditsRequired decimal(9, 2) NULL);  








CREATE TABLE ProgramParticipationAE(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefAeInstructionalProgramTypeId INTEGER NULL,
	RefAePostsecondaryTransitionActionId INTEGER NULL,
	PostsecondaryTransitionDate date NULL,
	RefAeSpecialProgramTypeId INTEGER NULL,
	RefAeFunctioningLevelAtIntakeId INTEGER NULL,
	RefAeFunctioningLevelAtPosttestId INTEGER NULL,
	RefGoalsForAttendingAdultEducationId INTEGER NULL,
	DisplacedHomemakerIndicator bit NULL,
	ProxyContactHours decimal(5, 1) NULL,
	InstructionalActivityHoursCompleted decimal(9, 2) NULL,
	RefCorrectionalEducationFacilityTypeId INTEGER NULL,
	RefWorkbasedLearningOpportunityTypeId INTEGER NULL);  








CREATE TABLE ProgramParticipationCte(
	OrganizationPersonRoleId INTEGER NOT NULL,
	CteParticipant bit NULL,
	CteConcentrator bit NULL,
	CteCompleter bit NULL,
	SingleParentOrSinglePregnantWoman bit NULL,
	DisplacedHomemakerIndicator bit NULL,
	CteNonTraditionalCompletion bit NULL,
	RefNonTraditionalGenderStatusId INTEGER NULL,
	RefWorkbasedLearningOpportunityTypeId INTEGER NULL,
	CareerPathwaysProgramParticipationExitDate date NULL,
	CareerPathwaysProgramParticipationStartDate date NULL);  








CREATE TABLE ProgramParticipationFoodService(
	ProgramParticipationFoodServiceId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefSchoolFoodServiceProgramId INTEGER NOT NULL);  








CREATE TABLE ProgramParticipationMigrant(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefMepEnrollmentTypeId INTEGER NULL,
	RefMepProjectBasedId INTEGER NULL,
	RefMepServiceTypeId INTEGER NULL,
	MepEligibilityExpirationDate date NULL,
	ContinuationOfServicesStatus bit NULL,
	RefContinuationOfServicesReasonId INTEGER NULL,
	BirthdateVerification varchar(60) NULL,
	ImmunizationRecordFlag bit NULL,
	MigrantStudentQualifyingArrivalDate date NULL,
	LastQualifyingMoveDate date NULL,
	QualifyingMoveFromCity varchar(30) NULL,
	RefQualifyingMoveFromStateId INTEGER NULL,
	RefQualifyingMoveFromCountryId INTEGER NULL,
	DesignatedGraduationSchoolId INTEGER NULL);  








CREATE TABLE ProgramParticipationNeglected(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefNeglectedProgramTypeId INTEGER NULL,
	AchievementIndicator bit NULL,
	OutcomeIndicator bit NULL,
	ObtainedEmployment bit NULL);  








CREATE TABLE ProgramParticipationSpecialEducation(
	OrganizationPersonRoleId INTEGER NOT NULL,
	AwaitingInitialIDEAEvaluationStatus bit NULL,
	RefIDEAEducationalEnvironmentECId INTEGER NULL,
	RefIDEAEdEnvironmentSchoolAgeId INTEGER NULL,
	SpecialEducationFTE decimal(5, 4) NULL,
	RefSpecialEducationExitReasonId INTEGER NULL,
	SpecialEducationServicesExitDate date NULL);  








CREATE TABLE ProgramParticipationTeacherPrep(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefTeacherPrepEnrollmentStatusId INTEGER NULL,
	RefTeacherPrepCompleterStatusId INTEGER NULL,
	RefSupervisedClinicalExperienceId INTEGER NULL,
	ClinicalExperienceClockHours INTEGER NULL,
	RefTeachingCredentialBasisId INTEGER NULL,
	RefTeachingCredentialTypeId INTEGER NULL,
	RefCriticalTeacherShortageCandidateId INTEGER NULL,
	RefAltRouteToCertificationOrLicensureId INTEGER NULL);  








CREATE TABLE ProgramParticipationTitleI(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefTitleIIndicatorId INTEGER NULL);  








CREATE TABLE ProgramParticipationTitleIIILep(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefTitleIIIAccountabilityId INTEGER NULL,
	RefTitleIIILanguageInstructionProgramTypeId INTEGER NULL);  








CREATE TABLE PsCourse(
	OrganizationId INTEGER NOT NULL,
	RefCourseCreditBasisTypeId INTEGER NULL,
	RefCourseCreditLevelTypeId INTEGER NULL,
	CourseNumber varchar(30) NULL,
	OriginalCourseIdentifier varchar(40) NULL,
	OverrideSchoolCourseNumber varchar(30) NULL,
	RefNCESCollegeCourseMapCodeId INTEGER NULL,
	NCAAEligibilityInd INTEGER NULL,
	RefCipCodeId INTEGER NULL);  








CREATE TABLE PsInstitution(
	OrganizationId INTEGER NOT NULL,
	RefCarnegieBasicClassificationId INTEGER NULL,
	RefControlOfInstitutionId INTEGER NULL,
	RefLevelOfInstitutionId INTEGER NULL,
	RefPredominantCalendarSystemId INTEGER NULL,
	RefTenureSystemId INTEGER NULL,
	VirtualIndicator bit NULL,
	InstitutionallyControlledHousingStatus bit NULL,
	RefAdmissionConsiderationLevelId INTEGER NULL,
	RefAdmissionConsiderationTypeId INTEGER NULL);  








CREATE TABLE PsPriceOfAttendance(
	PSPriceOfAttendanceId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	SessionDesignator varchar(7) NULL,
	TuitionPublished decimal(9, 2) NULL,
	RefTuitionUnitId INTEGER NULL,
	BoardCharges decimal(9, 2) NULL,
	RoomCharges decimal(9, 2) NULL,
	BooksAndSuppliesCosts decimal(9, 2) NULL,
	RequiredStudentFees decimal(9, 2) NULL,
	ComprehensiveFee decimal(9, 2) NULL,
	OtherStudentExpenses decimal(9, 2) NULL,
	PriceOfAttendance decimal(9, 2) NULL,
	IPEDSCollectionYearDesignator varchar(9) NULL);  








CREATE TABLE PsProgram(
	PsProgramId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefCipVersionId INTEGER NULL,
	RefCipCodeId INTEGER NULL,
	ProgramLengthHours decimal(9, 2) NULL,
	RefProgramLengthHoursTypeId INTEGER NULL,
	NormalLengthTimeForCompletion varchar(60) NULL,
	RefTimeForCompletionUnitsId INTEGER NULL,
	RefPSExitOrWithdrawalTypeId INTEGER NULL,
	RefPSProgramLevelId INTEGER NULL,
	RefDQPCategoriesOfLearningId INTEGER NULL);  








CREATE TABLE PsSection(
	OrganizationId INTEGER NOT NULL,
	GradeValueQualifier varchar(2) NULL,
	RefCipCodeId INTEGER NULL,
	RefCourseGpaApplicabilityId INTEGER NULL,
	RefCourseHonorsTypeId INTEGER NULL,
	RefCourseInstructionMethodId INTEGER NULL,
	RefCourseLevelTypeId INTEGER NULL,
	RefDevelopmentalEducationTypeId INTEGER NULL,
	RefWorkbasedLearningOpportunityTypeId INTEGER NULL);  








CREATE TABLE PsSectionLocation(
	OrganizationId INTEGER NOT NULL,
	CourseInstructionSiteName varchar(60) NULL,
	RefCourseInstructionSiteTypeId INTEGER NULL);  








CREATE TABLE PsStaffEmployment(
	StaffEmploymentId INTEGER NOT NULL,
	RefFullTimeStatusId INTEGER NULL,
	FacultyStatus bit NULL,
	RefEmploymentContractTypeId INTEGER NULL,
	StandardOccupationalClass varchar(7) NULL,
	RefIpedsOccupationalCategoryId INTEGER NULL,
	InstructionalStaffStatus bit NULL,
	MedicalSchoolStaffStatus bit NULL,
	RefInstructionalStaffContractLengthId INTEGER NULL,
	RefInstructionalStaffFacultyTenureId INTEGER NULL,
	RefAcademicRankId INTEGER NULL,
	RefInstructionCreditTypeId INTEGER NULL,
	GraduateAssistantStatus bit NULL,
	RefGraduateAssistantIpedsCategoryId INTEGER NULL,
	AnnualBaseContractualSalary decimal(9, 2) NULL);  








CREATE TABLE PsStudentAcademicAward(
	PsStudentAcademicAwardId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	AcademicAwardDate varchar(14) NULL,
	RefAcademicAwardLevelId INTEGER NULL,
	AcademicAwardTitle varchar(80) NULL);  








CREATE TABLE PsStudentAcademicRecord(
	PsStudentAcademicRecordId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	AcademicYearDesignator varchar(9) NULL,
	RefAcademicTermDesignatorId INTEGER NULL,
	GradePointAverage decimal(9, 4) NULL,
	GradePointAverageCumulative decimal(9, 4) NULL,
	DualCreditDualEnrollmentCredits decimal(9, 4) NULL,
	AdvancedPlacementCreditsAwarded INTEGER NULL,
	RefProfessionalTechCredentialTypeId INTEGER NULL,
	DiplomaOrCredentialAwardDate varchar(7) NULL,
	EnteringTerm varchar(30) NULL,
	CourseTotal INTEGER NULL,
	RefCreditHoursAppliedOtherProgramId INTEGER NULL);  








CREATE TABLE PsStudentAdmissionTest(
	PsStudentAdmissionTestId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefStandardizedAdmissionTestId INTEGER NOT NULL,
	StandardizedAdmissionTestScore decimal(9, 2) NULL);  








CREATE TABLE PsStudentApplication(
	OrganizationPersonRoleId INTEGER NOT NULL,
	PostsecondaryApplicant bit NULL,
	GradePointAverageCumulative decimal(9, 2) NULL,
	RefGradePointAverageDomainId INTEGER NULL,
	RefGpaWeightedIndicatorId INTEGER NULL,
	HighSchoolPercentile decimal(5, 4) NULL,
	HighSchoolStudentClassRank INTEGER NULL,
	HighSchoolGraduatingClassSize INTEGER NULL,
	RefAdmittedStudentId INTEGER NULL,
	WaitListedStudent bit NULL);  








CREATE TABLE PsStudentCohort(
	OrganizationPersonRoleId INTEGER NOT NULL,
	CohortGraduationYear varchar(4) NULL);  








CREATE TABLE PsStudentCourseSectionMark(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefCourseAcademicGradeStatusCodeId INTEGER NULL,
	CourseNarrativeExplanationGrade varchar(300) NULL,
	StudentCourseSectionGradeNarrative varchar(300) NULL);  








CREATE TABLE PsStudentDemographic(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefDependencyStatusId INTEGER NULL,
	RefTuitionResidencyTypeId INTEGER NULL,
	RefCampusResidencyTypeId INTEGER NULL,
	RefPsLepTypeId INTEGER NULL,
	RefPaternalEducationLevelId INTEGER NULL,
	RefMaternalEducationLevelId INTEGER NULL,
	RefCohortExclusionId INTEGER NULL,
	NumberOfDependents INTEGER NULL);  








CREATE TABLE PsStudentEmployment(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefEmployedWhileEnrolledId INTEGER NULL,
	RefEmployedAfterExitId INTEGER NULL,
	EmploymentNaicsCode varchar(6) NULL,
	RefEmploymentStatusWhileEnrolledId INTEGER NULL);  








CREATE TABLE PsStudentEnrollment(
	PSStudentEnrollmentId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefPsEnrollmentTypeId INTEGER NULL,
	RefPsEnrollmentStatusId INTEGER NULL,
	DegreeOrCertificateSeekingStudent bit NULL,
	FirstTimePostsecondaryStudent bit NULL,
	RefPsStudentLevelId INTEGER NULL,
	RefPsEnrollmentAwardTypeId INTEGER NULL,
	InitialEnrollmentTerm varchar(30) NULL,
	RefTransferReadyId INTEGER NULL,
	InstructionalActivityHoursAttempted decimal(9, 2) NULL,
	InstructionalActivityHoursCompleted decimal(9, 2) NULL,
	RefInstructionalActivityHoursId INTEGER NULL,
	RefDistanceEducationCourseEnrollmentId INTEGER NULL,
	HousingOnCampus bit NULL,
	FraternityParticipationStatus bit NULL,
	SororityParticipationStatus bit NULL,
	EntryDateIntoPostsecondary date NULL,
	DistanceEducationProgramEnrollmentInd bit NULL,
	DoctoralCandidacyAdmitInd bit NULL,
	DoctoralCandidacyDate date NULL,
	DoctoralExamTakenDate date NULL,
	RefDoctoralExamsRequiredCodeId INTEGER NULL,
	RefGraduateOrDoctoralExamResultsStatusId INTEGER NULL,
	OralDefenseCompletedIndicator bit NULL,
	OralDefenseDate date NULL,
	PostsecondaryEnteringStudentInd bit NULL,
	ThesisOrDissertationTitle varchar(300) NULL,
	RefDevelopmentalEducationReferralStatusId INTEGER NULL,
	RefDevelopmentalEducationTypeId INTEGER NULL);  








CREATE TABLE PsStudentFinancialAid(
	OrganizationPersonRoleId INTEGER NOT NULL,
	FinancialAidApplicant bit NULL,
	FinancialNeed decimal(9, 2) NULL,
	RefNeedDeterminationMethodId INTEGER NULL,
	TitleIVParticipantAndRecipient bit NULL,
	FinancialAidIncomeLevel decimal(9, 2) NULL,
	RefFinancialAidVeteransBenefitStatusId INTEGER NULL,
	RefFinancialAidVeteransBenefitTypeId INTEGER NULL);  








CREATE TABLE PSStudentProgram(
	PSStudentProgramId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefCipUseId INTEGER NULL,
	PsProgramId INTEGER NULL,
	RefWorkbasedLearningOpportunityTypeId INTEGER NULL,
	RefTransferOutIndicatorId INTEGER NULL);  








CREATE TABLE PsStudentSection(
	OrganizationPersonRoleId SERIAL NOT NULL,
	CourseOverrideSchool varchar(80) NULL,
	DegreeApplicability bit NULL,
	AcademicGrade varchar(15) NULL,
	NumberOfCreditsEarned decimal(9, 2) NULL,
	QualityPointsEarned decimal(9, 2) NULL,
	RefCourseRepeatCodeId INTEGER NULL,
	RefCourseAcademicGradeStatusCodeId INTEGER NULL);  








CREATE TABLE QuarterlyEmploymentRecord(
	QuarterlyEmploymentRecordId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	Earnings decimal(9, 0) NULL,
	EmploymentNAICSCode varchar(50) NULL,
	ReferencePeriodStartDate date NULL,
	ReferencePeriodEndDate date NULL,
	RefERAdministrativeDataSourceId INTEGER NULL,
	RefEmploymentLocationId INTEGER NULL,
	RefEmployedPriorToEnrollmentId INTEGER NULL);  








CREATE TABLE RefAbsentAttendanceCategory(
	RefAbsentAttendanceCategoryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAcademicAwardLevel(
	RefAcademicAwardLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAcademicHonorType(
	RefAcademicHonorTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAcademicRank(
	RefAcademicRankId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAcademicSubject(
	RefAcademicSubjectId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAcademicTermDesignator(
	RefAcademicTermDesignatorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAccommodationsNeededType(
	RefAccommodationsNeededTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAccreditationAgency(
	RefAccreditationAgencyId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  




CREATE TABLE RefActivityRecognitionType(
	RefActivityRecognitionTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  










CREATE TABLE RefActivityTimeMeasurementType(
	RefActivityTimeMeasurementTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAdditionalCreditType(
	RefAdditionalCreditTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAddressType(
	RefAddressTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAdministrativeFundingControl(
	RefAdministrativeFundingControlId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAdmissionConsiderationLevel(
	RefAdmissionConsiderationLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAdmissionConsiderationType(
	RefAdmissionConsiderationTypeId SERIAL NOT NULL,
	Description varchar(150) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAdmittedStudent(
	RefAdmittedStudentId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAdvancedPlacementCourseCode(
	RefAdvancedPlacementCourseCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAeCertificationType(
	RefAeCertificationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAeFunctioningLevelAtIntake(
	RefAeFunctioningLevelAtIntakeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAeFunctioningLevelAtPosttest(
	RefAeFunctioningLevelAtPosttestId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAeInstructionalProgramType(
	RefAeInstructionalProgramTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAePostsecondaryTransitionAction(
	RefAePostsecondaryTransitionActionId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAeSpecialProgramType(
	RefAeSpecialProgramTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAeStaffClassification(
	RefAeStaffClassificationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAeStaffEmploymentStatus(
	RefAeStaffEmploymentStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAllergySeverity(
	RefAllergySeverityId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAllergyType(
	RefAllergyTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAlternateFundUses(
	RefAlternateFundUsesId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAlternativeSchoolFocus(
	RefAlternativeSchoolFocusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAltRouteToCertificationOrLicensure(
	RefAltRouteToCertificationOrLicensureId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAmaoAttainmentStatus(
	RefAmaoAttainmentStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefApipInteractionType(
	RefAPIPInteractionTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentAccommodationCategory(
	RefAssessmentAccommodationCategoryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentAccommodationType(
	RefAssessmentAccommodationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentAssetIdentifierType(
	RefAssessmentAssetIdentifierTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentAssetType(
	RefAssessmentAssetTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentELDevelopmentalDomain(
	RefAssessmentELDevelopmentalDomainId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(60) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(6, 2) NULL);  








CREATE TABLE RefAssessmentFormSectionIdentificationSystem(
	RefAssessmentFormSectionIdentificationSystemId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentItemCharacteristicType(
	RefAssessmentItemCharacteristicTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentItemResponseScoreStatus(
	RefAssessmentItemResponseScoreStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentItemResponseStatus(
	RefAssessmentItemResponseStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentItemType(
	RefAssessmentItemTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedAlternativeRepresentationType(
	RefAssessmentNeedAlternativeRepresentationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedBrailleGradeType(
	RefAssessmentNeedBrailleGradeTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedBrailleMarkType(
	RefAssessmentNeedBrailleMarkTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedBrailleStatusCellType(
	RefAssessmentNeedBrailleStatusCellTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedHazardType(
	RefAssessmentNeedHazardTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedIncreasedWhitespacingType(
	RefAssessmentNeedIncreasedWhitespacingTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedLanguageLearnerType(
	RefAssessmentNeedLanguageLearnerTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedMaskingType(
	RefAssessmentNeedMaskingTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedNumberOfBrailleDots(
	RefAssessmentNeedNumberOfBrailleDotsId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedSigningType(
	RefAssessmentNeedSigningTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedSpokenSourcePreferenceType(
	RefAssessmentNeedSpokenSourcePreferenceTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedSupportTool(
	RefAssessmentNeedSupportToolId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedUsageType(
	RefAssessmentNeedUsageTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentNeedUserSpokenPreferenceType(
	RefAssessmentNeedUserSpokenPreferenceTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentParticipationIndicator(
	RefAssessmentParticipationIndicatorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentPlatformType(
	RefAssessmentPlatformTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentPretestOutcome(
	RefAssessmentPretestOutcomeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentPurpose(
	RefAssessmentPurposeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentReasonNotCompleting(
	RefAssessmentReasonNotCompletingId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentReasonNotTested(
	RefAssessmentReasonNotTestedId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentRegistrationCompletionStatus(
	RefAssessmentRegistrationCompletionStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentReportingMethod(
	RefAssessmentReportingMethodId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentResultDataType(
	RefAssessmentResultDataTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentResultScoreType(
	RefAssessmentResultScoreTypeId SERIAL NOT NULL,
	Description varchar(150) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentSessionSpecialCircumstanceType(
	RefAssessmentSessionSpecialCircumstanceTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentSessionStaffRoleType(
	RefAssessmentSessionStaffRoleTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentSessionType(
	RefAssessmentSessionTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentSubtestIdentifierType(
	RefAssessmentSubtestIdentifierTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentType(
	RefAssessmentTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAssessmentTypeChildrenWithDisabilities(
	RefAssessmentTypeChildrenWithDisabilitiesId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAttendanceEventType(
	RefAttendanceEventTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAttendanceStatus(
	RefAttendanceStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefAypStatus(
	RefAypStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefBarrierToEducatingHomeless(
	RefBarrierToEducatingHomelessId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefBillableBasisType(
	RefBillableBasisTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefBlendedLearningModelType(
	RefBlendedLearningModelTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefBloomsTaxonomyDomain(
	RefBloomsTaxonomyDomainId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefBuildingUseType(
	RefBuildingUseTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCalendarEventType(
	RefCalendarEventTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCampusResidencyType(
	RefCampusResidencyTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCareerCluster(
	RefCareerClusterId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCareerEducationPlanType(
	RefCareerEducationPlanTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCarnegieBasicClassification(
	RefCarnegieBasicClassificationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCharterSchoolApprovalAgencyType(
	RefCharterSchoolApprovalAgencyTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCharterSchoolManagementOrganizationType(
	RefCharterSchoolManagementOrganizationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(60) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(6, 2) NULL);  








CREATE TABLE RefCharterSchoolType(
	RefCharterSchoolTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefChildDevelopmentalScreeningStatus(
	RefChildDevelopmentalScreeningStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefChildDevelopmentAssociateType(
	RefChildDevelopmentAssociateTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefChildOutcomesSummaryRating(
	RefChildOutcomesSummaryRatingId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCipCode(
	RefCipCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCipUse(
	RefCipUseId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCipVersion(
	RefCipVersionId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefClassroomPositionType(
	RefClassroomPositionTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCohortExclusion(
	RefCohortExclusionId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCommunicationMethod(
	RefCommunicationMethodId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCommunityBasedType(
	RefCommunityBasedTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCompetencySetCompletionCriteria(
	RefCompetencySetCompletionCriteriaId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefContentStandardType(
	RefContentStandardTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefContinuationOfServices(
	RefContinuationOfServicesReasonId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefControlOfInstitution(
	RefControlOfInstitutionId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCoreKnowledgeArea(
	RefCoreKnowledgeAreaId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCorrectionalEducationFacilityType(
	RefCorrectionalEducationFacilityTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCorrectiveActionType(
	RefCorrectiveActionId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCountry(
	RefCountryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCounty(
	RefCountyId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseAcademicGradeStatusCode(
	RefCourseAcademicGradeStatusCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseApplicableEducationLevel(
	RefCourseApplicableEducationLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseCreditBasisType(
	RefCourseCreditBasisTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseCreditLevelType(
	RefCourseCreditLevelTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseCreditUnit(
	RefCourseCreditUnitId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseGpaApplicability(
	RefCourseGPAApplicabilityId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseHonorsType(
	RefCourseHonorsTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseInstructionMethod(
	RefCourseInstructionMethodId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseInstructionSiteType(
	RefCourseInstructionSiteTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseInteractionMode(
	RefCourseInteractionModeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseLevelCharacteristic(
	RefCourseLevelCharacteristicId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseLevelType(
	RefCourseLevelTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseRepeatCode(
	RefCourseRepeatCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseSectionAssessmentReportingMethod(
	RefCourseSectionAssessmentReportingMethodId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseSectionDeliveryMode(
	RefCourseSectionDeliveryModeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseSectionEnrollmentStatusType(
	RefCourseSectionEnrollmentStatusTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseSectionEntryType(
	RefCourseSectionEntryTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCourseSectionExitType(
	RefCourseSectionExitTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCredentialType(
	RefCredentialTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCreditHoursAppliedOtherProgram(
	RefCreditHoursAppliedOtherProgramId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCreditTypeEarned(
	RefCreditTypeEarnedId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCriticalTeacherShortageCandidate(
	RefCriticalTeacherShortageCandidateId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCteGraduationRateInclusion(
	RefCteGraduationRateInclusionId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCteNonTraditionalGenderStatus(
	RefCTENonTraditionalGenderStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefCurriculumFrameworkType(
	RefCurriculumFrameworkTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDegreeOrCertificateType(
	RefDegreeOrCertificateTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDentalInsuranceCoverageType(
	RefDentalInsuranceCoverageTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDentalScreeningStatus(
	RefDentalScreeningStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDependencyStatus(
	RefDependencyStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDevelopmentalEducationReferralStatus(
	RefDevelopmentalEducationReferralStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDevelopmentalEducationType(
	RefDevelopmentalEducationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDevelopmentalEvaluationFinding(
	RefDevelopmentalEvaluationFindingId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDirectoryInformationBlockStatus(
	RefDirectoryInformationBlockStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDisabilityConditionStatusCode(
	RefDisabilityConditionStatusCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDisabilityConditionType(
	RefDisabilityConditionTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDisabilityDeterminationSourceType(
	RefDisabilityDeterminationSourceTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDisabilityType(
	RefDisabilityTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDisciplinaryActionTaken(
	RefDisciplinaryActionTakenId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDisciplineLengthDifferenceReason(
	RefDisciplineLengthDifferenceReasonId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDisciplineMethodFirearms(
	RefDisciplineMethodFirearmsId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDisciplineMethodOfCwd(
	RefDisciplineMethodOfCwdId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDisciplineReason(
	RefDisciplineReasonId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDistanceEducationCourseEnrollment(
	RefDistanceEducationCourseEnrollmentId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  










CREATE TABLE RefDoctoralExamsRequiredCode(
	RefDoctoralExamsRequiredCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefDQPCategoriesOfLearning(
	RefDQPCategoriesOfLearningId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(60) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(6, 2) NULL);  








CREATE TABLE RefEarlyChildhoodCredential(
	RefEarlyChildhoodCredentialId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEarlyChildhoodProgramEnrollmentType(
	RefEarlyChildhoodProgramTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEarlyChildhoodServices(
	RefEarlyChildhoodServicesId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEducationLevel(
	RefEducationLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	RefEducationLevelTypeId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEducationLevelType(
	RefEducationLevelTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEducationVerificationMethod(
	RefEducationVerificationMethodId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELEducationStaffClassification(
	RefELEducationStaffClassificationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefElementaryMiddleAdditional(
	RefElementaryMiddleAdditionalId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELEmploymentSeparationReason(
	RefELEmploymentSeparationReasonId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELFacilityLicensingStatus(
	RefELFacilityLicensingStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELFederalFundingType(
	RefELFederalFundingTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELGroupSizeStandardMet(
	RefELGroupSizeStandardMetId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELLevelOfSpecialization(
	RefELLevelOfSpecializationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELLocalRevenueSource(
	RefELLocalRevenueSourceId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELOtherFederalFundingSources(
	RefELOtherFederalFundingSourcesId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELOutcomeMeasurementLevel(
	RefELOutcomeMeasurementLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELProfessionalDevelopmentTopicArea(
	RefELProfessionalDevelopmentTopicAreaId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELProgramEligibility(
	RefELProgramEligibilityId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELProgramEligibilityStatus(
	RefELProgramEligibilityStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELProgramLicenseStatus(
	RefELProgramLicenseStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELServiceProfessionalStaffClassification(
	RefELServiceProfessionalStaffClassificationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELServiceType(
	RefELServiceTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELStateRevenueSource(
	RefELStateRevenueSourceId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefELTrainerCoreKnowledgeArea(
	RefELTrainerCoreKnowledgeAreaId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEmailType(
	RefEmailTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEmployedAfterExit(
	RefEmployedAfterExitId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEmployedPriorToEnrollment(
	RefEmployedPriorToEnrollmentId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEmployedWhileEnrolled(
	RefEmployedWhileEnrolledId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEmploymentContractType(
	RefEmploymentContractTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEmploymentLocation(
	RefEmploymentLocationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEmploymentSeparationReason(
	RefEmploymentSeparationReasonId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEmploymentSeparationType(
	RefEmploymentSeparationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEmploymentStatus(
	RefEmploymentStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEmploymentStatusWhileEnrolled(
	RefEmploymentStatusWhileEnrolledId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEndOfTermStatus(
	RefEndOfTermStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEnrollmentStatus(
	RefEnrollmentStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEntityType(
	RefEntityTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEntryType(
	RefEntryTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefEnvironmentSetting(
	RefEnvironmentSettingId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefERAdministrativeDataSource(
	RefERAdministrativeDataSourceId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefERSRuralUrbanContinuumCode(
	RefERSRuralUrbanContinuumCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefExitOrWithdrawalStatus(
	RefExitOrWithdrawalStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefExitOrWithdrawalType(
	RefExitOrWithdrawalTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFamilyIncomeSource(
	RefFamilyIncomeSourceId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFederalProgramFundingAllocationType(
	RefFederalProgramFundingAllocationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialAccountBalanceSheetCode(
	RefFinancialBalanceSheetAccountCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialAccountCategory(
	RefFinancialAccountCategoryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialAccountFundClassification(
	RefFinancialAccountFundClassificationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialAccountProgramCode(
	RefFinancialAccountProgramCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialAccountRevenueCode(
	RefFinancialAccountRevenueCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialAidApplicationType(
	RefFinancialAidApplicationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialAidAwardStatus(
	RefFinancialAidStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialAidAwardType(
	RefFinancialAidAwardTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialAidVeteransBenefitStatus(
	RefFinancialAidVeteransBenefitStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialAidVeteransBenefitType(
	RefFinancialAidVeteransBenefitTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialExpenditureFunctionCode(
	RefFinancialExpenditureFunctionCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialExpenditureLevelOfInstructionCode(
	RefFinancialExpenditureLevelOfInstructionCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFinancialExpenditureObjectCode(
	RefFinancialExpenditureObjectCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFirearmType(
	RefFirearmTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFoodServiceEligibility(
	RefFoodServiceEligibilityId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdiction INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFoodServiceParticipation(
	RefFoodServiceParticipationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFrequencyOfService(
	RefFrequencyOfServiceId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefFullTimeStatus(
	RefFullTimeStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefGoalsForAttendingAdultEducation(
	RefGoalsForAttendingAdultEducationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefGpaWeightedIndicator(
	RefGpaWeightedIndicatorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefGradeLevel(
	RefGradeLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	RefGradeLevelTypeId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefGradeLevelType(
	RefGradeLevelTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefGradePointAverageDomain(
	RefGradePointAverageDomainId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefGraduateAssistantIpedsCategory(
	RefGraduateAssistantIpedsCategoryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefGraduateOrDoctoralExamResultsStatus(
	RefGraduateOrDoctoralExamResultsStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefGunFreeSchoolsActReportingStatus(
	RefGunFreeSchoolsActStatusReportingId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefHealthInsuranceCoverage(
	RefHealthInsuranceCoverageId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefHearingScreeningStatus(
	RefHearingScreeningStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefHigherEducationInstitutionAccreditationStatus(
	RefHigherEducationInstitutionAccreditationStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefHighSchoolDiplomaDistinctionType(
	RefHighSchoolDiplomaDistinctionTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefHighSchoolDiplomaType(
	RefHighSchoolDiplomaTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefHighSchoolGraduationRateIndicator(
	RefHSGraduationRateIndicatorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefHomelessNighttimeResidence(
	RefHomelessNighttimeResidenceId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIDEADisciplineMethodFirearm(
	RefIDEADisciplineMethodFirearmId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIDEAEducationalEnvironmentEC(
	RefIDEAEducationalEnvironmentECId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIDEAEducationalEnvironmentSchoolAge(
	RefIDESEducationalEnvironmentSchoolAge SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIDEAEnvironmentEL(
	RefIDEAEnvironmentELId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIDEAIEPStatus(
	RefIDEAIEPStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIDEAInterimRemoval(
	RefIDEAInterimRemovalId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIDEAInterimRemovalReason(
	RefIDEAInterimRemovalReasonId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIDEAPartCEligibilityCategory(
	RefIDEAPartCEligibilityCategoryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(60) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(6, 2) NULL);  








CREATE TABLE RefImmunizationType(
	RefImmunizationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIncidentBehavior(
	RefIncidentBehaviorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIncidentBehaviorSecondary(
	RefIncidentBehaviorSecondaryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIncidentInjuryType(
	RefIncidentInjuryTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIncidentLocation(
	RefIncidentLocationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIncidentMultipleOffenseType(
	RefIncidentMultipleOffenseTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIncidentPerpetratorInjuryType(
	RefIncidentPerpetratorInjuryTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIncidentPersonRoleType(
	RefIncidentPersonRoleTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIncidentPersonType(
	RefIncidentPersonTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIncidentReporterType(
	RefIncidentReporterTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIncidentTimeDescriptionCode(
	RefIncidentTimeDescriptionCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIncomeCalculationMethod(
	RefIncomeCalculationMethodId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIncreasedLearningTimeType(
	RefIncreasedLearningTimeTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIndividualizedProgramDateType(
	RefIndividualizedProgramDateTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIndividualizedProgramLocation(
	RefIndividualizedProgramLocationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIndividualizedProgramPlannedServiceType(
	RefIndividualizedProgramPlannedServiceTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIndividualizedProgramTransitionType(
	RefIndividualizedProgramTransitionTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIndividualizedProgramType(
	RefIndividualizedProgramTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefInstitutionTelephoneType(
	RefInstitutionTelephoneTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefInstructionalActivityHours(
	RefInstructionalActivityHoursId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefInstructionalStaffContractLength(
	RefInstructionalStaffContractLengthId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefInstructionalStaffFacultyTenure(
	RefInstructionalStaffFacultyTenureId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefInstructionCreditType(
	RefInstructionCreditTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefInstructionLocationType(
	RefInstructionLocationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIntegratedTechnologyStatus(
	RefIntegratedTechnologyStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefInternetAccess(
	RefInternetAccessId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefIpedsOccupationalCategory(
	RefIpedsOccupationalCategoryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefISO6392Language(
	RefISO6392LanguageId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(60) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(6, 2) NULL);  








CREATE TABLE RefISO6393Language(
	RefISO6393LanguageId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(60) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(6, 2) NULL);  








CREATE TABLE RefISO6395LanguageFamily(
	RefISO6395LanguageFamilyId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(60) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(6, 2) NULL);  








CREATE TABLE RefItemResponseTheoryDifficultyCategory(
	RefItemResponseTheoryDifficultyCategoryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefItemResponseTheoryKappaAlgorithm(
	RefItemResponseTheoryKappaAlgorithmId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefK12EndOfCourseRequirement(
	RefK12EndOfCourseRequirementId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefK12LeaTitleISupportService(
	RefK12LEATitleISupportServiceId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefK12ResponsibilityType(
	RefK12ResponsibilityTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefK12StaffClassification(
	RefEducationStaffClassificationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLanguage(
	RefLanguageId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition XML NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLanguageUseType(
	RefLanguageUseTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLeaFundsTransferType(
	RefLeaFundsTransferTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLeaImprovementStatus(
	RefLeaImprovementStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearnerActionType(
	RefLearnerActionTypeId SERIAL NOT NULL,
	Description varchar(150) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearnerActivityMaximumTimeAllowedUnits(
	RefLearnerActivityMaximumTimeAllowedUnitsId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearnerActivityType(
	RefLearnerActivityTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceAccessAPIType(
	RefLearningResourceAccessAPITypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceAccessHazardType(
	RefLearningResourceAccessHazardTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceAccessModeType(
	RefLearningResourceAccessModeTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceAccessRightsUrl(
	RefLearningResourceAccessRightsUrlId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceAuthorType(
	RefLearningResourceAuthorTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceBookFormatType(
	RefLearningResourceBookFormatTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceCompetencyAlignmentType(
	RefLearningResourceCompetencyAlignmentTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceControlFlexibilityType(
	RefLearningResourceControlFlexibilityTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceDigitalMediaSubType(
	RefLearningResourceDigitalMediaSubTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceDigitalMediaType(
	RefLearningResourceDigitalMediaTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceEducationalUse(
	RefLearningResourceEducationalUseId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceIntendedEndUserRole(
	RefLearningResourceIntendedEndUserRoleId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceInteractionMode(
	RefLearningResourceInteractionModeId SERIAL NOT NULL,
	Description varchar(150) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceInteractivityType(
	RefLearningResourceInteractivityTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceMediaFeatureType(
	RefLearningResourceMediaFeatureTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourcePhysicalMediaType(
	RefLearningResourcePhysicalMediaTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningResourceType(
	RefLearningResourceTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningStandardDocumentPublicationStatus(
	RefLearningStandardDocumentPublicationStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningStandardItemAssociationType(
	RefLearningStandardItemAssociationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningStandardItemNodeAccessibilityProfile(
	RefLearningStandardItemNodeAccessibilityProfileId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLearningStandardItemTestabilityType(
	RefLearningStandardItemTestabilityTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLeaType(
	RefLeaTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLeaveEventType(
	RefLeaveEventTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLevelOfInstitution(
	RefLevelOfInstitutionId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLicenseExempt(
	RefLicenseExemptId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefLiteracyAssessment(
	RefLiteracyAssessmentId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMagnetSpecialProgram(
	RefMagnetSpecialProgramId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMedicalAlertIndicator(
	RefMedicalAlertIndicatorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMepEnrollmentType(
	RefMepEnrollmentTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMepProjectBased(
	RefMepProjectBasedId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMepProjectType(
	RefMepProjectTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMepServiceType(
	RefMepServiceTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMepSessionType(
	RefMepSessionTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMepStaffCategory(
	RefMepStaffCategoryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMethodOfServiceDelivery(
	RefMethodOfServiceDeliveryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMilitaryActiveStudentIndicator(
	RefMilitaryActiveStudentIndicatorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMilitaryBranch(
	RefMilitaryBranchId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(60) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(6, 2) NULL);  








CREATE TABLE RefMilitaryConnectedStudentIndicator(
	RefMilitaryConnectedStudentIndicatorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMilitaryVeteranStudentIndicator(
	RefMilitaryVeteranStudentIndicatorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefMultipleIntelligenceType(
	RefMultipleIntelligenceTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefNaepAspectsOfReading(
	RefNaepAspectsOfReadingId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefNaepMathComplexityLevel(
	RefNaepMathComplexityLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefNCESCollegeCourseMapCode(
	RefNCESCollegeCourseMapCodeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefNeedDeterminationMethod(
	RefNeedDeterminationMethodId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefNeglectedProgramType(
	RefNeglectedProgramTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefNonPromotionReason(
	RefNonPromotionReasonId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefNonTraditionalGenderStatus(
	RefNonTraditionalGenderStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefOperationalStatus(
	RefOperationalStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	RefOperationalStatusTypeId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefOperationalStatusType(
	RefOperationalStatusTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefOrganizationElementType(
	RefOrganizationElementTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefOrganizationIdentificationSystem(
	RefOrganizationIdentificationSystemId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	RefOrganizationIdentifierTypeId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefOrganizationIdentifierType(
	RefOrganizationIdentifierTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefOrganizationIndicator(
	RefOrganizationIndicatorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	RefOrganizationTypeId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefOrganizationLocationType(
	RefOrganizationLocationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefOrganizationMonitoringNotifications(
	RefOrganizationMonitoringNotificationsId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefOrganizationRelationship(
	RefOrganizationRelationshipId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefOrganizationType(
	RefOrganizationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	RefOrganizationElementTypeId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefOtherNameType(
	RefOtherNameTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefOutcomeTimePoint(
	RefOutcomeTimePointId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefParaprofessionalQualification(
	RefParaprofessionalQualificationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefParticipationStatusAyp(
	RefParticipationStatusAypId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefParticipationType(
	RefParticipationTypeId SERIAL NOT NULL,
	OrganizationId INTEGER NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPDActivityApprovedPurpose(
	RefPDActivityApprovedForId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPDActivityCreditType(
	RefPDActivityCreditTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPDActivityEducationLevelsAddressed(
	RefPDActivityEducationLevelsAddressedId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPDActivityLevel(
	RefPDActivityLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPDActivityTargetAudience(
	RefPDActivityTargetAudienceId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPDActivityType(
	RefPDActivityTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPDAudienceType(
	RefPDAudienceTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPDDeliveryMethod(
	RefPDDeliveryMethodId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPDInstructionalDeliveryMode(
	RefPDInstructionalDeliveryModeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPDSessionStatus(
	RefPDSessionStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPersonalInformationVerification(
	RefPersonalInformationVerificationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPersonIdentificationSystem(
	RefPersonIdentificationSystemId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	RefPersonIdentifierTypeId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPersonIdentifierType(
	RefPersonIdentifierTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPersonLocationType(
	RefPersonLocationTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	RoleId INTEGER NULL,
	RefAddressTypeId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPersonRelationship(
	RefPersonRelationshipId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPersonStatusType(
	RefPersonStatusTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPersonTelephoneNumberType(
	RefPersonTelephoneNumberTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPopulationServed(
	RefPopulationServedId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPreAndPostTestIndicator(
	RefPreAndPostTestIndicatorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPredominantCalendarSystem(
	RefPredominantCalendarSystemId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPreKEligibleAgesNonIDEA(
	RefPreKEligibleAgesNonIDEAId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPrekindergartenEligibility(
	RefPrekindergartenEligibilityId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPresentAttendanceCategory(
	RefPresentAttendanceCategoryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProfessionalDevelopmentFinancialSupport(
	RefProfessionalDevelopmentFinancialSupportId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProfessionalEducationJobClassification(
	RefProfessionalEducationJobClassificationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProfessionalTechnicalCredentialType(
	RefProfessionalTechnicalCredentialTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProficiencyStatus(
	RefProficiencyStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProficiencyTargetAyp(
	RefProficiencyTargetAypId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProgramDayLength(
	RefProgramDayLengthId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProgramExitReason(
	RefProgramExitReasonId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProgramGiftedEligibility(
	RefProgramGiftedEligibilityId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProgramLengthHoursType(
	RefProgramLengthHoursTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProgramSponsorType(
	RefProgramSponsorTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdiction INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProgramType(
	RefProgramTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProgressLevel(
	RefProgressLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPromotionReason(
	RefPromotionReasonId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefProofOfResidencyType(
	RefProofOfResidencyTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPsEnrollmentAction(
	RefPsEnrollmentActionId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdiction INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPsEnrollmentAwardType(
	RefPsEnrollmentAwardTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPsEnrollmentStatus(
	RefPsEnrollmentStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPsEnrollmentType(
	RefPsEnrollmentTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPSExitOrWithdrawalType(
	RefPSExitOrWithdrawalTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPsLepType(
	RefPsLepTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPSProgramLevel(
	RefPSProgramLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPsStudentLevel(
	RefPsStudentLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPublicSchoolChoiceStatus(
	RefPublicSchoolChoiceStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPublicSchoolResidence(
	RefPublicSchoolResidenceId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefPurposeOfMonitoringVisit(
	RefPurposeOfMonitoringVisitId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefQrisParticipation(
	RefQrisParticipationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefRace(
	RefRaceId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefReapAlternativeFundingStatus(
	RefReapAlternativeFundingStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefReasonDelayTransitionConf(
	RefReasonDelayTransitionConfId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefReconstitutedStatus(
	RefReconstitutedStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefReferralOutcome(
	RefReferralOutcomeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefReimbursementType(
	RefReimbursementTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefRestructuringAction(
	RefRestructuringActionId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefRlisProgramUse(
	RefRlisProgramUseId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefRoleStatus(
	RefRoleStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL,
	RefRoleStatusTypeId INTEGER NULL);  








CREATE TABLE RefRoleStatusType(
	RefRoleStatusTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSCEDCourseLevel(
	RefSCEDCourseLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSCEDCourseSubjectArea(
	RefSCEDCourseSubjectAreaId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefScheduledWellChildScreening(
	RefScheduledWellChildScreeningId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSchoolFoodServiceProgram(
	RefSchoolFoodServiceProgramId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdiction INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSchoolImprovementFunds(
	RefSchoolImprovementFundsId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSchoolImprovementStatus(
	RefSchoolImprovementStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSchoolLevel(
	RefSchoolLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSchoolType(
	RefSchoolTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefScoreMetricType(
	RefScoreMetricTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefServiceFrequency(
	RefServiceFrequencyId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefServiceOption(
	RefServiceOptionId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefServices(
	RefServicesId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSessionType(
	RefSessionTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSex(
	RefSexId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSigInterventionType(
	RefSigInterventionTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSingleSexClassStatus(
	RefSingleSexClassStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSpaceUseType(
	RefSpaceUseTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSpecialEducationAgeGroupTaught(
	RefSpecialEducationAgeGroupTaughtId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSpecialEducationExitReason(
	RefSpecialEducationExitReasonId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSpecialEducationStaffCategory(
	RefSpecialEducationStaffCategoryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefStaffPerformanceLevel(
	RefStaffPerformanceLevelId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefStandardizedAdmissionTest(
	RefStandardizedAdmissionTestId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefState(
	RefStateId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  









CREATE TABLE RefStateANSICode(
	Code char(2) NOT NULL,
	StateName varchar(100) NULL);  









CREATE TABLE RefStatePovertyDesignation(
	RefStatePovertyDesignationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefStudentSupportServiceType(
	RefStudentSupportServiceTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefSupervisedClinicalExperience(
	RefSupervisedClinicalExperienceId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTeacherEducationCredentialExam(
	RefTeacherEducationCredentialExamId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTeacherEducationExamScoreType(
	RefTeacherEducationExamScoreTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTeacherEducationTestCompany(
	RefTeacherEducationTestCompanyId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTeacherPrepCompleterStatus(
	RefTeacherPrepCompleterStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTeacherPrepEnrollmentStatus(
	RefTeacherPrepEnrollmentStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTeachingAssignmentRole(
	RefTeachingAssignmentRoleId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTeachingCredentialBasis(
	RefTeachingCredentialBasisId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTeachingCredentialType(
	RefTeachingCredentialTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTechnicalAssistanceDeliveryType(
	RefTechnicalAssistanceDeliveryTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTechnicalAssistanceType(
	RefTechnicalAssistanceTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTechnologyLiteracyStatus(
	RefTechnologyLiteracyStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTelephoneNumberType(
	RefTelephoneNumberTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTenureSystem(
	RefTenureSystemId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTextComplexitySystem(
	RefTextComplexitySystemId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTimeForCompletionUnits(
	RefTimeForCompletionUnitsId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTitleIIIAccountability(
	RefTitleIIIAccountabilityId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTitleIIILanguageInstructionProgramType(
	RefTitleIIILanguageInstructionProgramTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTitleIIIProfessionalDevelopmentType(
	RefTitleIIIProfessionalDevelopmentTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTitleIIndicator(
	RefTitleIIndicatorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTitleIInstructionalServices(
	RefTitleIInstructionalServicesId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTitleIProgramStaffCategory(
	RefTitleIProgramStaffCategoryId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTitleIProgramType(
	RefTitleIProgramTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTitleISchoolStatus(
	RefTitle1SchoolStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(400) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTransferOutIndicator(
	RefTransferOutIndicatorId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTransferReady(
	RefTransferReadyId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTribalAffiliation(
	RefTribalAffiliationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(60) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(6, 2) NULL);  








CREATE TABLE RefTrimesterWhenPrenatalCareBegan(
	RefTrimesterWhenPrenatalCareBeganId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTuitionResidencyType(
	RefTuitionResidencyTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefTuitionUnit(
	RefTuitionUnitId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefUSCitizenshipStatus(
	RefUSCitizenshipStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefVisaType(
	RefVisaTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefVisionScreeningStatus(
	RefVisionScreeningStatusId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefWageCollectionMethod(
	RefWageCollectionMethodId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefWageVerification(
	RefWageVerificationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefWeaponType(
	RefWeaponTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefWfProgramParticipation(
	RefWfProgramParticipationId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RefWorkbasedLearningOpportunityType(
	RefWorkbasedLearningOpportunityTypeId SERIAL NOT NULL,
	Description varchar(100) NOT NULL,
	Code varchar(50) NULL,
	Definition varchar(4000) NULL,
	RefJurisdictionId INTEGER NULL,
	SortOrder decimal(5, 2) NULL);  








CREATE TABLE RequiredImmunization(
	RequiredImmunizationId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefImmunizationTypeId INTEGER NOT NULL);    








CREATE TABLE Role(
	RoleId SERIAL NOT NULL,
	Name varchar(50) NULL,
	RefJurisdictionId INTEGER NULL);  








CREATE TABLE RoleAttendance(
	RoleAttendanceId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	NumberOfDaysInAttendance decimal(9, 2) NULL,
	NumberOfDaysAbsent decimal(9, 2) NULL,
	AttendanceRate decimal(5, 4) NULL);  








CREATE TABLE RoleAttendanceEvent(
	RoleAttendanceEventId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	Date date NOT NULL,
	RefAttendanceEventTypeId INTEGER NULL,
	RefAttendanceStatusId INTEGER NULL,
	RefAbsentAttendanceCategoryId INTEGER NULL,
	RefPresentAttendanceCategoryId INTEGER NULL,
	RefLeaveEventTypeId INTEGER NULL);  








CREATE TABLE RoleStatus(
	RoleStatusId SERIAL NOT NULL,
	StatusStartDate date NOT NULL,
	StatusEndDate timestamp NULL,
	RefRoleStatusId INTEGER NULL,
	OrganizationPersonRoleId INTEGER NOT NULL);  








CREATE TABLE Rubric(
	RubricId SERIAL NOT NULL,
	Identifier varchar(40) NULL,
	Title varchar(30) NULL,
	UrlReference varchar(300) NULL,
	Description XML NULL);  








CREATE TABLE RubricCriterion(
	RubricCriterionId SERIAL NOT NULL,
	Category varchar(30) NULL,
	Title varchar(30) NULL,
	Description XML NULL,
	Weight decimal(18, 0) NULL,
	Position INTEGER NULL,
	RubricId INTEGER NOT NULL);  








CREATE TABLE RubricCriterionLevel(
	RubricCriterionLevelId SERIAL NOT NULL,
	Description XML NULL,
	Quality XML NULL,
	Score decimal(18, 0) NULL,
	Feedback XML NULL,
	Position INTEGER NULL,
	RubricCriterionId INTEGER NOT NULL);  








CREATE TABLE ServicesReceived(
	ServicesReceivedId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefServicesId INTEGER NOT NULL,
	FullTimeEquivalency decimal(3, 2) NULL);  








CREATE TABLE StaffCredential(
	PersonCredentialId SERIAL NOT NULL,
	RefTeachingCredentialTypeId INTEGER NULL,
	RefTeachingCredentialBasisId INTEGER NULL,
	RefChildDevAssociateTypeId INTEGER NULL,
	RefParaprofessionalQualificationId INTEGER NULL,
	TechnologySkillsStandardsMet bit NULL,
	DiplomaOrCredentialAwardDate varchar(7) NULL,
	RefProgramSponsorTypeId INTEGER NULL,
	CTEInstructorIndustryCertification bit NULL);  








CREATE TABLE StaffEmployment(
	StaffEmploymentId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	HireDate date NULL,
	PositionTitle varchar(45) NULL,
	RefEmploymentSeparationTypeId INTEGER NULL,
	RefEmploymentSeparationReasonId INTEGER NULL,
	UnionMembershipName varchar(200) NULL,
	WeeksEmployedPerYear INTEGER NULL);  








CREATE TABLE StaffEvaluation(
	StaffEvaluationId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	System varchar(60) NULL,
	Scale varchar(80) NULL,
	ScoreOrRating varchar(60) NULL,
	Outcome varchar(80) NULL,
	RefStaffPerformanceLevelId INTEGER NULL);  








CREATE TABLE StaffExperience(
	PersonId INTEGER NOT NULL,
	YearsOfPriorTeachingExperience decimal(9, 2) NULL,
	YearsOfPriorAETeachingExperience decimal(9, 2) NULL);  








CREATE TABLE StaffProfessionalDevelopmentActivity(
	StaffProfessionalDevelopmentActivityId SERIAL NOT NULL,
	ProfessionalDevelopmentRequirementId INTEGER NOT NULL,
	ActivityTitle varchar(50) NULL,
	ActivityIdentifier varchar(40) NULL,
	ActivityStartDate date NULL,
	ActivityCompletionDate date NULL,
	ScholarshipStatus bit NULL,
	RefProfessionalDevelopmentFinancialSupportId INTEGER NULL,
	NumberOfCreditsEarned decimal(10, 2) NULL,
	RefCourseCreditUnitId INTEGER NULL,
	ProfessionalDevelopmentActivityId INTEGER NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	ProfessionalDevelopmentSessionId INTEGER NOT NULL);  








CREATE TABLE StaffTechnicalAssistance(
	StaffTechnicalAssistanceId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefTechnicalAssistanceTypeId INTEGER NULL,
	RefTechnicalAssistanceDeliveryTypeId INTEGER NULL,
	TechnicalAssistanceApprovedInd bit NULL);  








CREATE TABLE TeacherEducationCredentialExam(
	TeacherEducationCredentialExamId SERIAL NOT NULL,
	OrganizationPersonRoleId INTEGER NULL,
	RefTeacherEducationCredentialExamId INTEGER NULL,
	RefTeacherEducationExamScoreTypeId INTEGER NULL,
	RefTeacherEducationTestCompanyId INTEGER NULL);  








CREATE TABLE TeacherStudentDataLinkExclusion(
	TeacherStudentDataLinkExclusionId SERIAL NOT NULL,
	StudentOrganizationPersonRoleId INTEGER NOT NULL,
	TeacherOrganizationPersonRoleId INTEGER NOT NULL);  





CREATE TABLE WorkforceEmploymentQuarterlyData(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefEmployedWhileEnrolledId INTEGER NULL,
	RefEmployedAfterExitId INTEGER NULL,
	EmployedInMultipleJobsCount decimal(2, 0) NULL,
	MilitaryEnlistmentAfterExit bit NULL);  








CREATE TABLE WorkforceProgramParticipation(
	OrganizationPersonRoleId INTEGER NOT NULL,
	RefWfProgramParticipationId INTEGER NULL,
	RefProfessionalTechnicalCredentialTypeId INTEGER NULL,
	DiplomaOrCredentialAwardDate varchar(7) NULL);  




CREATE TABLE AssessmentItemApip(
	AssessmentItemId INTEGER NOT NULL,
	AdaptiveIndicator bit NULL,
	ResponseProcessingTemplateUrl varchar(300) NULL,
	ResponseProcessingXml XML NULL,
	ResponseDeclarationXml XML NULL,
	OutcomeDeclarationXml XML NULL,
	TemplateDeclarationXml XML NULL,
	TemplateProcessingXml XML NULL,
	ModalFeedbackXml XML NULL,
	ItemBodyXml XML NULL);  


CREATE TABLE AssessmentItemApipDescription(
	AssessmentItemId INTEGER NOT NULL,
	RefHazardTypeId INTEGER NULL,
	RefSupportToolTypeId INTEGER NULL,
	CognitiveGuidanceActivateByDefaultIndicator bit NULL,
	CognitiveGuidanceAssignedSupportIndicator bit NULL,
	ScaffoldingAssignedSupportIndicator bit NULL,
	ScaffoldingActivateByDefaultIndicator bit NULL,
	ChunkingAssignedSupportIndicator bit NULL,
	ChunkingActivateByDefaultIndicator bit NULL,
	KeywordEmphasisAssignedSupportIndicator bit NULL,
	KeywordEmphasisActivateByDefaultIndicator bit NULL,
	ReducedAnswersAssignedSupportIndicator bit NULL,
	ReducedAnswersActivateByDefaultIndicator bit NULL,
	NegativesRemovedAssignedSupportIndicator bit NULL,
	NegativesRemovedActivateByDefaultIndicator bit NULL,
	RefKeywordTranslationLanguageId INTEGER NULL,
	KeywordTranslationsAssignedSupportIndicator bit NULL,
	KeywordTranslationsActivateByDefaultIndicator bit NULL,
	BrailleIndicator bit NULL,
	TextOnlyIndicator bit NULL,
	TextOnlyOnDemandIndicator bit NULL,
	TextGraphicsIndicator bit NULL,
	GraphicsOnlyIndicator bit NULL,
	NonVisualIndicator bit NULL,
	AslIndicator bit NULL,
	AslOnDemandIndicator bit NULL,
	SignedEnglishIndicator bit NULL,
	SignedEnglishOnDemandIndicator bit NULL); 
	
	
	
	
CREATE TABLE AssessmentItemCharacteristic(
	AssessmentItemCharacteristicId SERIAL NOT NULL,
	AssessmentItemId INTEGER NOT NULL,
	RefAssessmentItemCharacteristicTypeId INTEGER NULL,
	Value varchar(30) NULL,
	ResponseChoicePattern varchar(100) NULL);  
	
	
	

CREATE TABLE AssessmentItemPossibleResponse(
	AssessmentItemPossibleResponseId SERIAL NOT NULL,
	AssessmentItemId INTEGER NOT NULL,
	PossibleResponseOption XML NULL,
	Value varchar(300) NULL,
	CorrectIndicator bit NULL,
	FeedbackMessage varchar(300) NULL,
	SequenceNumber INTEGER NULL);  
	
	

	




CREATE TABLE AssessmentItemResponse(
	AssessmentItemResponseId SERIAL NOT NULL,
	Value varchar(300) NULL,
	ScoreValue varchar(60) NULL,
	RefAssessItemResponseStatusId INTEGER NULL,
	RefProficiencyStatusId INTEGER NULL,
	AidSetUsed varchar(30) NULL,
	DescriptiveFeedback varchar(300) NULL,
	ScaffoldingItemFlag bit NULL,
	HintCount INTEGER NULL,
	HintIncludedAnswer bit NULL,
	Duration time(7) NULL,
	FirstAttemptDuration time(7) NULL,
	StartTime time(7) NULL,
	StartDate date NULL,
	SecurityIssue varchar(300) NULL,
	AssessmentItemId INTEGER NOT NULL,
	AssessmentParticipantSessionId INTEGER NOT NULL,
	ResultXML XML NULL,
	AssessmentItemResponseDescriptiveFeedbackDate timestamp NULL,
	RefAssessmentItemResponseScoreStatusId INTEGER NULL);
	







CREATE TABLE AssessmentItemResponseTheory(
	AssessmentItemId INTEGER NOT NULL,
	ParameterA INTEGER NULL,
	ParameterB INTEGER NULL,
	RefItemResponseTheoryDifficultyCategoryId INTEGER NULL,
	ParameterC INTEGER NULL,
	ParameterD1 INTEGER NULL,
	ParameterD2 INTEGER NULL,
	ParameterD3 INTEGER NULL,
	ParameterD4 INTEGER NULL,
	ParameterD5 INTEGER NULL,
	ParameterD6 INTEGER NULL,
	PointBiserialCorrelationValue INTEGER NULL,
	DIFValue INTEGER NULL,
	KappaValue INTEGER NULL,
	RefItemResponseTheoryKappaAlgorithmId INTEGER NULL);  

CREATE TABLE AssessmentItemRubricCriterionResult(
	AssessmentItemResponseId INTEGER NOT NULL,
	RubricCriterionLevelId INTEGER NOT NULL);  



CREATE TABLE AssessmentLanguage(
	AssessmentLanguageId SERIAL NOT NULL,
	AssessmentId INTEGER NOT NULL,
	RefLanguageId INTEGER NOT NULL);    


CREATE TABLE ELChildTransitionPlan(
	PersonId INTEGER NOT NULL,
	PartB619PotentialEligibilityInd bit NULL,
	IDEAPartCToPartBNotificationDate date NULL,
	TransitionConferenceDate date NULL,
	TransitionConferenceDeclineDate date NULL,
	DateOfTransitionPlan date NULL,
	IDEAPartCToPartBNotificationOptOutDate date NULL,
	IDEAPartCToPartBNotificationOptOutIndicator bit NULL,
	RefReasonDelayTransitionConfId INTEGER NULL,
	IndividualizedProgramId INTEGER NULL);  








CREATE TABLE ELClassSection(
	OrganizationId INTEGER NOT NULL,
	RefServiceOptionId INTEGER NULL,
	HoursAvailablePerDay decimal(4, 2) NULL,
	DaysAvailablePerWeek INTEGER NULL,
	RefEnvironmentSettingId INTEGER NULL,
	ELProgramAnnualOperatingWeeks INTEGER NULL,
	LanguageTranslationPolicy bit NULL,
	GroupSize INTEGER NULL);  




CREATE TABLE ELClassSectionService(
	ELClassSectionServiceId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	YoungestAgeServed INTEGER NULL,
	OldestAgeServed INTEGER NULL,
	ServesChildrenWithSpecialNeeds bit NULL,
	RefELGroupSizeStandardMetId INTEGER NULL,
	ELClassGroupCurriculumType varchar(60) NULL,
	RefFrequencyOfServiceId INTEGER NULL);  



CREATE TABLE ELEnrollment(
	OrganizationPersonRoleId INTEGER NOT NULL,
	ApplicationDate date NULL,
	EnrollmentDate date NULL,
	RefIDEAEnvironmentELId INTEGER NULL,
	NumberOfDaysInAttendance decimal(8, 2) NULL,
	RefFoodServiceParticipationId INTEGER NULL,
	RefServiceOptionId INTEGER NULL,
	ELClassSectionId INTEGER NULL,
	RefELFederalFundingTypeId INTEGER NULL);  


CREATE TABLE ELEnrollmentOtherFunding(
	ELEnrollmentOtherFundingId SERIAL NOT NULL,
	PersonId INTEGER NOT NULL,
	RefELOtherFederalFundingSourcesId INTEGER NOT NULL);  



CREATE TABLE ELFacilityLicensing(
	ELFacilityLicensingId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefELFacilityLicensingStatusId INTEGER NULL,
	StateLicensedFacilityCapacity INTEGER NULL,
	InitialLicensingDate date NULL,
	ContinuingLicenseDate date NULL,
	RefLicenseExemptId INTEGER NULL);  
	
	
CREATE TABLE ELOrganizationAvailability(
	OrganizationId INTEGER NOT NULL,
	DaysAvailablePerWeek INTEGER NULL,
	HoursAvailablePerDay INTEGER NULL,
	YoungestAgeServed INTEGER NULL,
	OldestAgeServed INTEGER NULL,
	AgeUnit varchar(10) NULL,
	RefEnvironmentSettingId INTEGER NULL,
	NumberOfClassrooms INTEGER NULL,
	RefServiceOptionId INTEGER NULL,
	RefPopulationServedId INTEGER NULL,
	AnnualOperatingWeeks INTEGER NULL);  
	
	

















CREATE TABLE ELOrganizationFunds(
	OrganizationId INTEGER NOT NULL,
	RefELFederalFundingTypeId INTEGER NULL,
	RefELLocalRevenueSourceId INTEGER NULL,
	RefELOtherFederalFundingSourcesId INTEGER NULL,
	RefELStateRevenueSourceId INTEGER NULL,
	RefBillableBasisTypeId INTEGER NULL,
	RefReimbursementTypeId INTEGER NULL);  








CREATE TABLE ELOrganizationMonitoring(
	ELOrganizationMonitoringId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	VisitStartDate date NULL,
	VisitEndDate date NULL,
	RefPurposeOfMonitoringVisitId INTEGER NULL,
	TypeOfMonitoring varchar(300) NULL,
	RefOrganizationMonitoringNotificationsId INTEGER NULL);  








CREATE TABLE ELProgramLicensing(
	ELProgramLicensingId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	RefELProgramLicenseStatusId INTEGER NULL,
	InitialLicenseDate date NULL,
	ContinuingLicenseDate date NULL,
	LicenseSuspensionStatus bit NULL,
	LicenseRevocationStatus bit NULL,
	NumberOfFatalities INTEGER NULL,
	NumberOfInjuries INTEGER NULL,
	RefLicenseExemptId INTEGER NULL);  








CREATE TABLE ELQualityInitiative(
	ELQualityInitiativeId SERIAL NOT NULL,
	OrganizationId INTEGER NOT NULL,
	MaximumScore varchar(30) NULL,
	MinimumScore varchar(30) NULL,
	ScoreLevel varchar(30) NULL,
	ParticipationIndicator bit NULL,
	ParticipationStartDate date NULL,
	ParticipationEndDate date NULL);  


CREATE TABLE K12TitleIIILanguageInstruction(
	K12TitleIIILanguageInstructionId SERIAL NOT NULL,
	OrganizationId int NOT NULL,
	RefTitleIIILanguageInstructionProgramTypeId int NOT NULL);
	

CREATE TABLE LearnerAction(
	LearnerActionId SERIAL NOT NULL,
	AssessmentItemResponseId int NULL,
	RefLearnerActionTypeId int NULL,
	Value XML NULL,
	LearnerActionDateTime TIMESTAMP NULL,
	LearnerActionActorIdentifier varchar(40) NULL,
	LearnerActionObjectDescription varchar(300) NULL,
	LearnerActionObjectIdentifier varchar(40) NULL,
	LearnerActionObjectType varchar(60) NULL);


CREATE TABLE LearningResourceEducationLevel(
	LearningResourceEducationLevelId SERIAL NOT NULL,
	LearningResourceId int NOT NULL,
	RefEducationLevelId int NOT NULL);


CREATE TABLE LearningResourcePeerRating(
	LearningResourcePeerRatingId SERIAL NOT NULL,
	LearningResourceId int NOT NULL,
	PersonId int NOT NULL,
	PeerRatingSystemId int NOT NULL,
	Value numeric(18, 4) NULL,
	Date date NULL);
CREATE TABLE LearningStandardDocument(
	LearningStandardDocumentId SERIAL NOT NULL,
	URI varchar(300) NULL,
	Title varchar(120) NULL,
	Subject varchar(30) NULL,
	Version varchar(30) NULL,
	Creator varchar(120) NULL,
	Jurisdiction varchar(120) NULL,
	Description varchar(300) NULL,
	Publisher varchar(30) NULL,
	RefLearningStandardDocumentPublicationStatusId int NULL,
	ValidStartDate date NOT NULL,
	ValidEndDate date NOT NULL,
	RefLanguageId int NULL,
	License varchar(300) NULL,
	Rights varchar(300) NULL,
	RightsHolder varchar(30) NULL,
	LearningStandardDocumentPublicationDate date NULL);

ALTER TABLE LearningStandardDocument			 ADD CONSTRAINT PK_LearningStandardDocument PRIMARY KEY (	LearningStandardDocumentId);
ALTER TABLE LearningResourcePeerRating		 ADD CONSTRAINT PK_LearningResourcePeerRating PRIMARY KEY (	LearningResourcePeerRatingId);
ALTER TABLE LearningResourceEducationLevel		 ADD CONSTRAINT PK_LearningResourceEducationLvl PRIMARY KEY (	LearningResourceEducationLevelId);
ALTER TABLE LearnerAction			 ADD CONSTRAINT PK_AssessmentItemLearnerAction PRIMARY KEY (	LearnerActionId);
ALTER TABLE ActivityRecognition			 	 ADD CONSTRAINT PK_ActivityRecognition PRIMARY KEY (	ActivityRecognitionId);
ALTER TABLE AeCourse					 ADD CONSTRAINT PK_AeCourse PRIMARY KEY (	OrganizationId);
ALTER TABLE AEProvider					 ADD CONSTRAINT PK_AEProvider PRIMARY KEY (	OrganizationId);
ALTER TABLE AEStaff					 ADD CONSTRAINT PK_AEStaff PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE AeStudentAcademicRecord			 ADD CONSTRAINT PK_AeStudentAcademicRecord PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE AeStudentEmployment				 ADD CONSTRAINT PK_AeStudentEmployment PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE ApipInteraction				 ADD CONSTRAINT PK_ApipInteraction PRIMARY KEY (	ApipInteractionId);
ALTER TABLE Application					 ADD CONSTRAINT PK_Application PRIMARY KEY (	ApplicationId);
ALTER TABLE Assessment					 ADD CONSTRAINT PK_Assessment PRIMARY KEY (	AssessmentId);
ALTER TABLE Assessment_AssessmentAdministration		 ADD CONSTRAINT PK_Assessment_AssessmentAdministration PRIMARY KEY (	Assessment_AssessmentAdministrationId);
ALTER TABLE AssessmentAdministration			 ADD CONSTRAINT PK_AssessmentAdministration PRIMARY KEY (	AssessmentAdministrationId);
ALTER TABLE AssessmentAdministration_Organization	 ADD CONSTRAINT PK_AssessmentAdministration_Organization PRIMARY KEY (	AssessmentAdministration_OrganizationId);
ALTER TABLE AssessmentAsset				 ADD CONSTRAINT PK_AssessmentAsset PRIMARY KEY (	AssessmentAssetId);
ALTER TABLE AssessmentELDevelopmentalDomain		 ADD CONSTRAINT PK_AssessmentELDevelopmentalDomain PRIMARY KEY (	AssessmentELDevelopmentalDomainId);
ALTER TABLE AssessmentForm				 ADD CONSTRAINT PK_AssessmentForm PRIMARY KEY (	AssessmentFormId);
ALTER TABLE AssessmentForm_AssessmentAsset		 ADD CONSTRAINT PK_AssessmentForm_AssessmentAsset PRIMARY KEY ( 	AssessmentForm_AssessmentAssetId);
ALTER TABLE AssessmentForm_AssessmentFormSection	 ADD CONSTRAINT PK_AssessmentForm_AssessmentFormSection PRIMARY KEY (	AssessmentForm_AssessmentFormSectionId);
ALTER TABLE AssessmentFormSection			 ADD CONSTRAINT PK_AssessmentFormSection PRIMARY KEY (	AssessmentFormSectionId);
 ALTER TABLE AssessmentFormSection_AssessmentAsset	 ADD CONSTRAINT PK_AssessmentFormSection_AssessmentAsset PRIMARY KEY (	AssessmentFormSection_AssessmentAssetId);
ALTER TABLE AssessmentFormSection_AssessmentItem	 ADD CONSTRAINT PK_AssessmentFormSection_AssessmentItem PRIMARY KEY (	AssessmentFormSectionItemId);
ALTER TABLE AssessmentItem				 ADD CONSTRAINT PK_AssessmentItem PRIMARY KEY (	AssessmentItemId);
ALTER TABLE AssessmentItemBody				 ADD CONSTRAINT PK_AssessmentItemBody PRIMARY KEY (	AssessmentItemId);

ALTER TABLE AssessmentItemApipDescription		 ADD CONSTRAINT PK_AssessmentItemApipDescription PRIMARY KEY (	AssessmentItemId);
ALTER TABLE AssessmentItemCharacteristic		 ADD CONSTRAINT PK_AssessmentItemCharacteristic PRIMARY KEY (	AssessmentItemCharacteristicId);
ALTER TABLE AssessmentItemPossibleResponse		 ADD CONSTRAINT PK_AssessmentItemPossibleResponse PRIMARY KEY (	AssessmentItemPossibleResponseId);
ALTER TABLE AssessmentItemResponse			 ADD CONSTRAINT PK_AssessmentItemResponse PRIMARY KEY (	AssessmentItemResponseId);
 ALTER TABLE AssessmentItemResponseTheory		 ADD CONSTRAINT PK_AssessmentItemResponseTheory PRIMARY KEY (	AssessmentItemId);
ALTER TABLE AssessmentItemRubricCriterionResult		 ADD CONSTRAINT PK_AssessmentItemRubricCriterionResult PRIMARY KEY (	AssessmentItemResponseId);
 ALTER TABLE AssessmentLanguage			 ADD CONSTRAINT PK_AssessmentLanguage PRIMARY KEY (	AssessmentLanguageId);
ALTER TABLE AssessmentLevelsForWhichDesigned		 ADD CONSTRAINT PK_AssessmentLevelsForWhichDesigned PRIMARY KEY (	AssessmentLevelsForWhichDesignedId);
ALTER TABLE AssessmentNeedApipContent			 ADD CONSTRAINT PK_AssessmentNeedApipContent PRIMARY KEY (	AssessmentNeedApipContentId);
ALTER TABLE AssessmentNeedApipControl			 ADD CONSTRAINT PK_AssessmentNeedApipControl PRIMARY KEY (	AssessmentNeedApipControlId);
ALTER TABLE AssessmentNeedApipDisplay			 ADD CONSTRAINT PK_AssessmentNeedApipDisplay PRIMARY KEY (	AssessmentNeedApipDisplayId);
ALTER TABLE AssessmentNeedBraille			 ADD CONSTRAINT PK_AssessmentNeedBraille PRIMARY KEY (	AssessmentNeedBrailleId);
ALTER TABLE AssessmentNeedScreenEnhancement		 ADD CONSTRAINT PK_AssessmentNeedScreenEnhancement PRIMARY KEY (	AssessmentNeedScreenEnhancementId);
ALTER TABLE AssessmentParticipantSession		 ADD CONSTRAINT PK_AssessmentParticipantSession PRIMARY KEY (	AssessmentParticipantSessionId);
 ALTER TABLE AssessmentParticipantSession_Accommodation	 ADD CONSTRAINT PK_AssessmentParticipantSession_Accomodation PRIMARY KEY (	AssessmentParticipantSession_AccommodationId);
ALTER TABLE AssessmentPerformanceLevel			 ADD CONSTRAINT PK_AssessmentPerformanceLevel PRIMARY KEY (	AssessmentPerformanceLevelId);
 ALTER TABLE AssessmentPersonalNeedLanguageLearner ADD CONSTRAINT PK_AssessmentNeedsProfileContentLanguageLearner PRIMARY KEY (	AssessmentPersonalNeedLanguageLearnerId);
ALTER TABLE AssessmentPersonalNeedScreenReader		 ADD CONSTRAINT PK_AssessmentPersonalNeedScreenReader PRIMARY KEY (	AssessmentPersonalNeedScreenReaderId);
 ALTER TABLE AssessmentPersonalNeedsProfile			 ADD CONSTRAINT PK_AssessmentNeedsProfile PRIMARY KEY (	AssessmentPersonalNeedsProfileId);
ALTER TABLE AssessmentPersonalNeedsProfileContent		 ADD CONSTRAINT PK_AssessmentNeedsProfileContent PRIMARY KEY (	AssessmentPersonalNeedsProfileContentId);
ALTER TABLE AssessmentPersonalNeedsProfileControl	 ADD CONSTRAINT PK_AssessmentPersonalNeedsProfileControl PRIMARY KEY (	AssessmentPersonalNeedsProfileControlId);
ALTER TABLE AssessmentPersonalNeedsProfileDisplay	 ADD CONSTRAINT PK_AssessmentPersonalNeedsProfileDisplay PRIMARY KEY (	AssessmentPersonalNeedsProfileDisplayId);
ALTER TABLE AssessmentPersonalNeedsProfileScreenEnhancement ADD CONSTRAINT PK_AssessmentPersonalNeedsProfileScreenEnhancement PRIMARY KEY (	AssessmentPersonalNeedsProfileScreenEnhancementId);
ALTER TABLE AssessmentRegistration			 ADD CONSTRAINT PK_AssessmentRegistration PRIMARY KEY (	AssessmentRegistrationId);
ALTER TABLE AssessmentRegistration_Accommodation	 ADD CONSTRAINT PK_AssessmentRegistration_Accommodation PRIMARY KEY (	AssessmentRegistration_AccommodationId);
ALTER TABLE AssessmentResult				 ADD CONSTRAINT PK_AssessmentResult PRIMARY KEY (	AssessmentResultId);
ALTER TABLE AssessmentResultRubricCriterionResult	 ADD CONSTRAINT PK_AssessmentResultRubricCriterionResult PRIMARY KEY (	AssessmentResultRubricCriterionResultId);
ALTER TABLE AssessmentSession				 ADD CONSTRAINT PK_AssessmentSession PRIMARY KEY (	AssessmentSessionId);
ALTER TABLE AssessmentSessionStaffRole			 ADD CONSTRAINT PK_AssessmentSessionStaffRole PRIMARY KEY (	AssessmentSessionStaffRoleId);
 ALTER TABLE AssessmentSubtest			 ADD CONSTRAINT PK_AssessmentSubtest PRIMARY KEY (	AssessmentSubtestId);
ALTER TABLE AssessmentSubtest_AssessmentItem		 ADD CONSTRAINT PK_AssessmentSubtest_AssessmentItem PRIMARY KEY (	AssessmentSubtestItemId);
ALTER TABLE AssessmentSubtest_LearningStandardItem	 ADD CONSTRAINT PK_AssessmentSubtestLearningStandardItem PRIMARY KEY (	AssessmentSubTest_LearningStandardItemId);
ALTER TABLE AssessmentSubtestELDevelopmentalDomain	 ADD CONSTRAINT PK_AssessmentSubtestELDevelopmentalDomain PRIMARY KEY (	AssessmentSubtestELDevelopmentalDomainId);
ALTER TABLE AssessmentSubtestLevelsForWhichDesigned	 ADD CONSTRAINT PK_AssessmentSubtestLevelsForWhichDesigned PRIMARY KEY (	AssessmentSubtestLevelsForWhichDesignedId);
ALTER TABLE Authentication				 ADD CONSTRAINT PK_Authentication PRIMARY KEY (	AuthenticationId);
ALTER TABLE Authorizations				 ADD CONSTRAINT PK_Authorization PRIMARY KEY (	AuthorizationId);
ALTER TABLE Classroom					 ADD CONSTRAINT PK_Classroom PRIMARY KEY (	LocationId);
ALTER TABLE CompetencyItem_CompetencySet		 ADD CONSTRAINT PK_CompetencyItem_CompetencySet PRIMARY KEY (	CompetencyItem_CompetencySetId);
ALTER TABLE CompetencySet				 ADD CONSTRAINT PK_CompetencySet PRIMARY KEY (	CompetencySetId);
ALTER TABLE CoreKnowledgeArea				 ADD CONSTRAINT PK_CoreKnowledgeArea PRIMARY KEY (	CoreKnowledgeAreaId);
ALTER TABLE Course					 ADD CONSTRAINT PK_Course PRIMARY KEY (	OrganizationId);
ALTER TABLE CourseSection				 ADD CONSTRAINT PK_CourseSection PRIMARY KEY (	OrganizationId);
ALTER TABLE CourseSectionAssessmentReporting		 ADD CONSTRAINT PK_CourseSectionAssessmentReporting PRIMARY KEY (	CourseSectionAssessmentReportingId);
ALTER TABLE CourseSectionLocation			 ADD CONSTRAINT PK_CourseSectionLocation PRIMARY KEY (	CourseSectionLocationId);
ALTER TABLE CourseSectionSchedule			 ADD CONSTRAINT PK_CourseSectionSchedule PRIMARY KEY (	CourseSectionScheduleId);
ALTER TABLE CteCourse					 ADD CONSTRAINT PK_CteCourse PRIMARY KEY (	OrganizationId);
ALTER TABLE CteStudentAcademicRecord			 ADD CONSTRAINT PK_CteStudentAcademicRecord PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE EarlyChildhoodCredential			 ADD CONSTRAINT PK_EarlyChildhoodCredential PRIMARY KEY (	PersonCredentialId);
ALTER TABLE EarlyChildhoodProgramTypeOffered		 ADD CONSTRAINT PK_EarlyChildhoodProgramTypeOffered PRIMARY KEY (	EarlyChildhoodProgramTypeOfferedId);
ALTER TABLE ELChildDemographic				 ADD CONSTRAINT PK_ELChildDemographic PRIMARY KEY (	PersonId);
ALTER TABLE ELChildDevelopmentalAssessment		 ADD CONSTRAINT PK_ELChildDevelopmentalAssessment PRIMARY KEY (	PersonId);
ALTER TABLE ELChildHealth				 ADD CONSTRAINT PK_ELChildHealth PRIMARY KEY (	PersonId);
ALTER TABLE ELChildIndividualizedProgram		 ADD CONSTRAINT PK_ELChildIndividualizedProgram PRIMARY KEY (	PersonId);
ALTER TABLE ELChildOutcomeSummary			 ADD CONSTRAINT PK_ELChildOutcomeSummary PRIMARY KEY (	PersonId);
ALTER TABLE ELChildProgramEligibility			 ADD CONSTRAINT PK_ELChildProgramEligibility PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE ELChildService				 ADD CONSTRAINT PK_ELChildService PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE ELChildServicesApplication			 ADD CONSTRAINT PK_ELChildServicesApplication PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE ELChildTransitionPlan					 ADD CONSTRAINT PK_ELChildIDEA PRIMARY KEY (	PersonId);
ALTER TABLE ELClassSection				 ADD CONSTRAINT PK_ELClassSection PRIMARY KEY (	OrganizationId);
ALTER TABLE ELClassSectionService			 ADD CONSTRAINT PK_ELClassSectionService PRIMARY KEY (	ELClassSectionServiceId);
 ALTER TABLE ELEnrollment				 ADD CONSTRAINT PK_ECEnrollment PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE ELEnrollmentOtherFunding			 ADD CONSTRAINT PK_ELEnrollmentOtherFunding PRIMARY KEY (	ELEnrollmentOtherFundingId);
ALTER TABLE ELFacilityLicensing				 ADD CONSTRAINT PK_ELFacilityLicensing PRIMARY KEY (	ELFacilityLicensingId);
ALTER TABLE ELOrganizationAvailability			 ADD CONSTRAINT PK_ELOrganizationAvailability PRIMARY KEY (	OrganizationId);
ALTER TABLE ELOrganizationFunds				 ADD CONSTRAINT PK_ELOrganizationFunds PRIMARY KEY (	OrganizationId);
ALTER TABLE ELOrganizationMonitoring			 ADD CONSTRAINT PK_ELOrganizationMonitoring PRIMARY KEY (	ELOrganizationMonitoringId);
ALTER TABLE ELProgramLicensing				 ADD CONSTRAINT PK_ELProgramLicensing PRIMARY KEY (	ELProgramLicensingId);
ALTER TABLE ELQualityInitiative				 ADD CONSTRAINT PK_ELQualityInitiative PRIMARY KEY (	ELQualityInitiativeId);
ALTER TABLE ELQualityRatingImprovement			 ADD CONSTRAINT PK_ELQualityRatingImprovement PRIMARY KEY (	ELQualityRatingImprovementId);


ALTER TABLE ELServicePartner				 ADD CONSTRAINT PK_ELServicePartner PRIMARY KEY (	OrganizationId);
ALTER TABLE ELStaff					 ADD CONSTRAINT PK_ELStaff PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE ELStaffAssignment				 ADD CONSTRAINT PK_ELStaffAssignment PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE ELStaffEducation				 ADD CONSTRAINT PK_ELStaffEducation PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE ELStaffEmployment				 ADD CONSTRAINT PK_ELStaffEmployment PRIMARY KEY (	StaffEmploymentId);
ALTER TABLE Facility					 ADD CONSTRAINT PK_Facility PRIMARY KEY (	LocationId);
ALTER TABLE FinancialAccount				 ADD CONSTRAINT PK_FinancialAccount PRIMARY KEY (	FinancialAccountId);
ALTER TABLE FinancialAccountProgram			 ADD CONSTRAINT PK_FinancialAccountProgram PRIMARY KEY (	FinancialAccountProgramId);
ALTER TABLE FinancialAidApplication			 ADD CONSTRAINT PK_FinancialAidApplication PRIMARY KEY (	FinancialAidApplicationId);
ALTER TABLE FinancialAidAward				 ADD CONSTRAINT PK_FinancialAidAward PRIMARY KEY (	FinancialAidAwardId);
ALTER TABLE Incident					 ADD CONSTRAINT PK_Incident PRIMARY KEY (	IncidentId);
ALTER TABLE IndividualizedProgram			 ADD CONSTRAINT PK_IndividualizedProgram PRIMARY KEY (	IndividualizedProgramId);
ALTER TABLE IndividualizedProgramService		 ADD CONSTRAINT PK_IndividualizedProgramService PRIMARY KEY (	IndividualizedProgramServiceId);
ALTER TABLE K12Course					 ADD CONSTRAINT PK_K12Course PRIMARY KEY (	OrganizationId);
ALTER TABLE K12Lea					 ADD CONSTRAINT PK_K12Lea PRIMARY KEY (	OrganizationId);
ALTER TABLE K12LEAFederalFunds				 ADD CONSTRAINT PK_K12LEAFederalFunds PRIMARY KEY (	OrganizationId);
ALTER TABLE K12LEAFederalReporting			 ADD CONSTRAINT PK_K12LEAFederalReporting PRIMARY KEY (	OrganizationId);
ALTER TABLE K12LeaPreKEligibility			 ADD CONSTRAINT PK_K12LeaPreKEligibility PRIMARY KEY (	K12LEAPreKEligibilityId);
ALTER TABLE K12LEAPreKEligibleAgesIDEA			 ADD CONSTRAINT PK_K12LEAPreKEligibleAgesIDEA PRIMARY KEY (	K12LEAPreKEligibleAgesIDEAId);
ALTER TABLE K12LeaSafeDrugFree			 ADD CONSTRAINT PK_K12SchoolSafeDrugFree PRIMARY KEY (	OrganizationId);
ALTER TABLE K12LeaTitleIIIProfessionalDevelopment		 ADD CONSTRAINT PK_K12LEATitleIIIProfessionalDev PRIMARY KEY (	K12LEATitleIIIProfessionalDevelopmentId);
ALTER TABLE K12LEATitleISupportService			 ADD CONSTRAINT PK_K12LEATitleISupportService PRIMARY KEY (	K12LeaTitleISupportServiceId);
ALTER TABLE K12OrganizationStudentResponsibility			 ADD CONSTRAINT PK_K12OrgStudentResponsibility PRIMARY KEY (	K12OrganizationStudentResponsibilityId);
ALTER TABLE K12ProgramOrService				 ADD CONSTRAINT PK_K12LEAProgram PRIMARY KEY (	OrganizationId);
ALTER TABLE K12School				 ADD CONSTRAINT PK_K12School PRIMARY KEY (	OrganizationId);
ALTER TABLE K12SchoolCorrectiveAction			 ADD CONSTRAINT PK_K12SchoolCorrectiveAction PRIMARY KEY (	K12SchoolCorrectiveActionId);
ALTER TABLE K12SchoolGradeOffered			 ADD CONSTRAINT PK_K12SchoolGradeOffered PRIMARY KEY (	K12SchoolGradeOfferedId);
ALTER TABLE K12SchoolImprovement			 ADD CONSTRAINT XPKK12SchoolImprovement PRIMARY KEY (	K12SchoolImprovementId);
ALTER TABLE K12SchoolStatus				 ADD CONSTRAINT PK_K12SchoolStatus PRIMARY KEY (	OrganizationId);
ALTER TABLE K12Sea					 ADD CONSTRAINT PK_K12Sea PRIMARY KEY (	OrganizationId);
ALTER TABLE K12SEAAlternateFundUse			 ADD CONSTRAINT PK_K12SEAAlternateFundUse PRIMARY KEY (	K12SEAlternateFundUseId);
ALTER TABLE K12SEAFederalFundAllocation			 ADD CONSTRAINT PK_K12SEAFederalFundAllocation PRIMARY KEY (	K12SEAFederalFundAllocationId);
ALTER TABLE K12SEAFederalFunds				 ADD CONSTRAINT PK_K12SEAFederalFunds PRIMARY KEY (	OrganizationId);
ALTER TABLE K12StaffAssignment				 ADD CONSTRAINT PK_K12StaffAssignment PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE K12StaffEmployment				 ADD CONSTRAINT PK_K12StaffEmployment PRIMARY KEY (	StaffEmploymentId);
ALTER TABLE K12StudentAcademicHonor			 ADD CONSTRAINT PK_K12StudentAcademicHonor PRIMARY KEY (	K12StudentAcademicHonorId);
ALTER TABLE K12StudentAcademicRecord			 ADD CONSTRAINT PK_K12StudentAcademicRecord PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE K12StudentActivity				 ADD CONSTRAINT PK_K12StudentActivity PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE K12StudentCohort				 ADD CONSTRAINT PK_K12StudentCohort PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE K12StudentCourseSection			 ADD CONSTRAINT PK_K12StudentCourseSection PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE K12StudentCourseSectionMark			 ADD CONSTRAINT PK_K12StudentCourseSectionMark PRIMARY KEY (	K12StudentCourseSectionMarkId);
ALTER TABLE K12StudentDiscipline			 ADD CONSTRAINT PK_K12StudentDiscipline PRIMARY KEY (	K12StudentDisciplineId);
ALTER TABLE K12StudentEmployment			 ADD CONSTRAINT PK_K12StudentEmployment PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE K12StudentEnrollment			 ADD CONSTRAINT PK_K12EnrollmentMember PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE K12StudentGraduationPlan			 ADD CONSTRAINT PK_K12StudentGraduationPlan PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE K12StudentLiteracyAssessment		 ADD CONSTRAINT PK_K12StudentLiteracyAssessment PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE K12StudentSession				 ADD CONSTRAINT PK_K12StudentSession PRIMARY KEY (	K12StudentSessionId);
ALTER TABLE TeacherStudentDataLinkExclusion		 ADD CONSTRAINT PK_TeacherStudentDataLinkExclusion PRIMARY KEY (	TeacherStudentDataLinkExclusionId);
ALTER TABLE WorkforceEmploymentQuarterlyData		 ADD CONSTRAINT PK_WorkforceEmploymentQuarterlyData PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE WorkforceProgramParticipation		 ADD CONSTRAINT PK_WorkforceProgramParticipation PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE StaffEvaluation				 ADD CONSTRAINT PK_StaffEvaluation PRIMARY KEY (	StaffEvaluationId);
ALTER TABLE StaffExperience				 ADD CONSTRAINT PK_StaffExperience PRIMARY KEY (	PersonId);
ALTER TABLE StaffProfessionalDevelopmentActivity	 ADD CONSTRAINT PK_StaffProfessionalDevelopmentActivity PRIMARY KEY (	StaffProfessionalDevelopmentActivityId);
ALTER TABLE StaffTechnicalAssistance			 ADD CONSTRAINT PK_StaffTechnicalAssistance PRIMARY KEY (	StaffTechnicalAssistanceId);
ALTER TABLE Location					 ADD CONSTRAINT PK_Location PRIMARY KEY (	LocationId);
ALTER TABLE Organization				 ADD CONSTRAINT PK_Organization PRIMARY KEY (	OrganizationId);
ALTER TABLE OrganizationAccreditation			 ADD CONSTRAINT PK_OrganizationAccreditation PRIMARY KEY (	OrganizationAccreditationId);
ALTER TABLE OrganizationCalendar			 ADD CONSTRAINT PK_OrganizationCalendar PRIMARY KEY (	OrganizationCalendarId);
ALTER TABLE OrganizationCalendarCrisis			 ADD CONSTRAINT PK_OrganizationCalendarCrisis PRIMARY KEY (	OrganizationCalendarCrisisId);
ALTER TABLE OrganizationCalendarDay			 ADD CONSTRAINT PK_OrganizationCalendarDay PRIMARY KEY (	OrganizationCalendarDayId);
ALTER TABLE OrganizationCalendarEvent			 ADD CONSTRAINT PK_OrganizationCalendarEvent PRIMARY KEY (	OrganizationCalendarEventId);
ALTER TABLE OrganizationCalendarSession			 ADD CONSTRAINT PK_OrganizationCalendarSession PRIMARY KEY (	OrganizationCalendarSessionId);
ALTER TABLE OrganizationEmail				 ADD CONSTRAINT PK_OrganizationEmail PRIMARY KEY (	OrganizationEmailId);
ALTER TABLE OrganizationFederalAccountability		 ADD CONSTRAINT PK_OrganizationFederalAccountability PRIMARY KEY (	OrganizationFederalAccountabilityId);
ALTER TABLE OrganizationFinancial			 ADD CONSTRAINT PK_OrganizationFinancial PRIMARY KEY (	OrganizationFinancialId);
ALTER TABLE OrganizationIdentifier			 ADD CONSTRAINT PK_OrganizationIdentifier PRIMARY KEY (	OrganizationIdentifierId);
ALTER TABLE OrganizationIndicator			 ADD CONSTRAINT PK_OrganizationIndicator PRIMARY KEY (	OrganizationIndicatorId);
ALTER TABLE OrganizationLocation			 ADD CONSTRAINT PK_OrganizationLocation PRIMARY KEY (	OrganizationLocationId);
ALTER TABLE OrganizationOperationalStatus		 ADD CONSTRAINT PK_OrganizationOperationalStatus PRIMARY KEY (	OrganizationOperationalStatusId);
ALTER TABLE OrganizationPersonRole			 ADD CONSTRAINT PK_OrganizationPersonRole PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE OrganizationPolicy				 ADD CONSTRAINT PK_OrganizationPolicy PRIMARY KEY (	OrganizationPolicyId);
ALTER TABLE OrganizationProgramType			 ADD CONSTRAINT PK_OrganizationProgramType PRIMARY KEY (	OrganizationProgramTypeId);
ALTER TABLE OrganizationRelationship			 ADD CONSTRAINT PK_OrganizationRelationship PRIMARY KEY (	OrganizationRelationshipId);
ALTER TABLE OrganizationTechnicalAssistance		 ADD CONSTRAINT PK_OrganizationTechnicalAssistance PRIMARY KEY (	OrganizationTechnicalAssistanceId);
ALTER TABLE OrganizationWebsite				 ADD CONSTRAINT PK_OrganizationWebsite PRIMARY KEY (	OrganizationId);
ALTER TABLE PeerRatingSystem				 ADD CONSTRAINT PK_PeerRatingSystem PRIMARY KEY (	PeerRatingSystemId);
ALTER TABLE Person					 ADD CONSTRAINT PK_Person PRIMARY KEY (	PersonId);
ALTER TABLE Person_AssessmentPersonalNeedsProfile	 ADD CONSTRAINT PK_Person_AssessmentPersonalNeedsProfile PRIMARY KEY (	Person_AssessmentPersonalNeedsProfileId);
ALTER TABLE PersonAddress				 ADD CONSTRAINT PK_PersonAddress PRIMARY KEY (	PersonAddressId);
ALTER TABLE PersonAllergy				 ADD CONSTRAINT PK_PersonAllergy PRIMARY KEY (	PersonAllergyId);
ALTER TABLE PersonBirthplace			         ADD CONSTRAINT PK_PersonBirthplace PRIMARY KEY (	PersonId);
ALTER TABLE PersonCareerEducationPlan			 ADD CONSTRAINT PK_PersonCareerEducationPlan PRIMARY KEY (	PersonCareerEducationPlanId);
ALTER TABLE PersonCredential				 ADD CONSTRAINT PK_PersonCredential PRIMARY KEY (	PersonCredentialId);
ALTER TABLE PersonDegreeOrCertificate		         ADD CONSTRAINT PK_PersonDegreeOrCertificate PRIMARY KEY (	PersonDegreeOrCertificateId);
ALTER TABLE PersonReferral				 ADD CONSTRAINT PK_PersonReferral PRIMARY KEY (	PersonReferralId);
ALTER TABLE PersonRelationship				 ADD CONSTRAINT XPKPersonRelationship PRIMARY KEY (	PersonRelationshipId);
ALTER TABLE PersonStatus				 ADD CONSTRAINT PK_PersonStatus PRIMARY KEY (	PersonStatusId);
ALTER TABLE PersonDisability				 ADD CONSTRAINT PK_PersonDisability PRIMARY KEY (	PersonId);
ALTER TABLE PersonEmailAddress				 ADD CONSTRAINT PK_PersonEmailAddress PRIMARY KEY (	PersonEmailAddressId);
ALTER TABLE PersonFamily				 ADD CONSTRAINT PK_PersonFamily PRIMARY KEY (	PersonFamilyId);
ALTER TABLE PersonHealth				 ADD CONSTRAINT PK_PersonHealth PRIMARY KEY (	PersonHealthId);
ALTER TABLE PersonHealthBirth				 ADD CONSTRAINT PK_PersonHealthBirth PRIMARY KEY (	PersonId);
ALTER TABLE PersonIdentifier			 ADD CONSTRAINT PK_PersonIdentifier PRIMARY KEY (	PersonIdentifierId);
ALTER TABLE PersonImmunization				 ADD CONSTRAINT PK_PersonImmunization PRIMARY KEY (	PersonImmunizationId);
ALTER TABLE PersonLanguage				 ADD CONSTRAINT PK_PersonLanguage PRIMARY KEY (	PersonLanguageId);
ALTER TABLE PersonMilitary				 ADD CONSTRAINT PK_PersonMilitary PRIMARY KEY (	PersonId);
ALTER TABLE PersonOtherName				 ADD CONSTRAINT PK_PersonOtherName PRIMARY KEY (	PersonOtherNameId);
ALTER TABLE PersonProgramParticipation		 ADD CONSTRAINT PK_PersonProgramParticipation PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE LearningStandardItem			 ADD CONSTRAINT PK_LearningStandardItem PRIMARY KEY (	LearningStandardItemId);
ALTER TABLE LearningStandardItemAssociation		 ADD CONSTRAINT PK_LearningStandardItemAssociation PRIMARY KEY (	LearningStandardItemAssociationId);
ALTER TABLE LearningStandardItemEducationLevel		 ADD CONSTRAINT PK_LearningStandardItemEducationLevel PRIMARY KEY (	LearningStandardItemEducationLevelId);
ALTER TABLE K12TitleIIILanguageInstruction			 ADD CONSTRAINT PK_K12TitleIIILanguageInstructionId PRIMARY KEY (	K12TitleIIILanguageInstructionId);
ALTER TABLE ProfessionalDevelopmentActivity		 ADD CONSTRAINT PK_ProfessionalDevelopmentActivity PRIMARY KEY (	ProfessionalDevelopmentActivityId);
ALTER TABLE ProfessionalDevelopmentRequirement		 ADD CONSTRAINT PK_ProfessionalDevelopmentRequirement PRIMARY KEY (	ProfessionalDevelopmentRequirementId);
ALTER TABLE ProfessionalDevelopmentSession		 ADD CONSTRAINT PK_ProfessionalDevelopmentSession PRIMARY KEY (	ProfessionalDevelopmentSessionId);
ALTER TABLE Program					 ADD CONSTRAINT PK_Program PRIMARY KEY (	OrganizationId);
ALTER TABLE ProgramParticipationAE			 ADD CONSTRAINT PK_ProgramParticipationAE PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE ProgramParticipationCte			 ADD CONSTRAINT PK_ProgramParticipationCte PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE ProgramParticipationFoodService		 ADD CONSTRAINT PK_ProgramParticipationFoodService PRIMARY KEY (	ProgramParticipationFoodServiceId);
ALTER TABLE ProgramParticipationMigrant			 ADD CONSTRAINT PK_ProgramParticipationMigrant PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE ProgramParticipationNeglected		 ADD CONSTRAINT PK_ProgramParticipationNeglected PRIMARY KEY (	OrganizationPersonRoleId);
ALTER TABLE PsCourse					 ADD CONSTRAINT PK_PsCourse PRIMARY KEY (	OrganizationId);
ALTER TABLE PsInstitution				 ADD CONSTRAINT PK_PsInstitution PRIMARY KEY (	OrganizationId);
ALTER TABLE PSPriceOfAttendance				 ADD CONSTRAINT PK_PSPriceOfAttendance PRIMARY KEY (	PSPriceOfAttendanceId);
ALTER TABLE PsProgram					 ADD CONSTRAINT PK_PsProgram PRIMARY KEY (	PsProgramId);
ALTER TABLE RubricCriterion				 ADD CONSTRAINT PK_RubricCriterion PRIMARY KEY (	RubricCriterionId);
ALTER TABLE RubricCriterionLevel			 ADD CONSTRAINT PK_RubricCriterionLevel PRIMARY KEY (	RubricCriterionLevelId);
ALTER TABLE ServicesReceived				 ADD CONSTRAINT PK_ServicesReceived PRIMARY KEY (	ServicesReceivedId);
ALTER TABLE StaffCredential				 ADD CONSTRAINT PK_StaffCredential PRIMARY KEY (	PersonCredentialId);
ALTER TABLE StaffEmployment				 ADD CONSTRAINT PK_StaffEmployment PRIMARY KEY (	StaffEmploymentId);
ALTER TABLE RoleAttendance				 ADD CONSTRAINT PK_RoleAttendance PRIMARY KEY (	RoleAttendanceId);
ALTER TABLE RoleAttendanceEvent				 ADD CONSTRAINT PK_RoleAttendanceEvent PRIMARY KEY (	RoleAttendanceEventId);
ALTER TABLE RoleStatus					 ADD CONSTRAINT PK_RoleStatus PRIMARY KEY (	RoleStatusId);
ALTER TABLE Rubric					 ADD CONSTRAINT PK_Rubric PRIMARY KEY (	RubricId);
ALTER TABLE LearningStandardItem			 ADD CONSTRAINT PK_LearningStandardItem PRIMARY KEY (	LearningStandardItemId);
ALTER TABLE LearningStandardItemAssociation		 ADD CONSTRAINT PK_LearningStandardItemAssociation PRIMARY KEY (	LearningStandardItemAssociationId);
ALTER TABLE LearningStandardItemEducationLevel		 ADD CONSTRAINT PK_LearningStandardItemEducationLevel PRIMARY KEY (	LearningStandardItemEducationLevelId);
ALTER TABLE PsSection					 ADD CONSTRAINT PK_PsSection PRIMARY KEY (	OrganizationId);
ALTER TABLE PsSectionLocation				 ADD CONSTRAINT PK_PsSectionLocation PRIMARY KEY (	OrganizationId);
ALTER TABLE PsStaffEmployment				 ADD CONSTRAINT PK_PsStaffEmployment PRIMARY KEY (	StaffEmploymentId);
