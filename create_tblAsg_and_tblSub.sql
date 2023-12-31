USE [DrawingCourse]
GO
/****** Object:  Table [dbo].[tblAssignment]    Script Date: 11/3/2023 10:23:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAssignment](
	[assignmentID] [varchar](250) NOT NULL,
	[topic] [varchar](250) NOT NULL,
	[courseID] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[assignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubmission]    Script Date: 11/3/2023 10:23:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubmission](
	[submissionID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [varchar](250) NOT NULL,
	[assignmentID] [varchar](250) NOT NULL,
	[learningCourseID] [int] NOT NULL,
	[isGraded] [bit] NOT NULL,
	[isPassed] [bit] NOT NULL,
	[instructorNote] [varchar](250) NULL,
	[grade] [float] NOT NULL,
	[project] VARBINARY(MAX),
PRIMARY KEY CLUSTERED 
(
	[submissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAssignment] ([assignmentID], [topic], [courseID]) VALUES (N'anime', N'Draw your own anime character using skills that you have learned through this course', N'anidraw')
INSERT [dbo].[tblAssignment] ([assignmentID], [topic], [courseID]) VALUES (N'digitalPainting', N'Using skills you have learned to draw a landscape painting on Photoshop', N'bdp1')
INSERT [dbo].[tblAssignment] ([assignmentID], [topic], [courseID]) VALUES (N'humanPortrait', N'Draw your own portrait or your partner (family, friends,...) portrait then submit it', N'portrait')
INSERT [dbo].[tblAssignment] ([assignmentID], [topic], [courseID]) VALUES (N'sketching', N'Draw your country landscape, using color (optional) or only pencil, base on your skill level then submit it', N'skp1')
INSERT [dbo].[tblAssignment] ([assignmentID], [topic], [courseID]) VALUES (N'useBlender', N'Use Blender to create your ideal dungeon, capture your screen with full objects and setting then submit it', N'blender1')
INSERT [dbo].[tblAssignment] ([assignmentID], [topic], [courseID]) VALUES (N'Vector', N'Using vector to create a game scene base on your imagination, capture your screen with full element then submit it', N'vector1')
GO
ALTER TABLE [dbo].[tblAssignment]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[tblCourse] ([courseID])
GO
ALTER TABLE [dbo].[tblSubmission]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblSubmission]  WITH CHECK ADD FOREIGN KEY([assignmentID])
REFERENCES [dbo].[tblAssignment] ([assignmentID])
GO
ALTER TABLE [dbo].[tblSubmission]  WITH CHECK ADD FOREIGN KEY([learningCourseID])
REFERENCES [dbo].[tblLearningCourse] ([learningCourseID])
GO

INSERT INTO tblLearningCourse(isLearning, expiredDay, courseID, accountID) VALUES(0, '2023-09-10', 'vector1', 'user321')