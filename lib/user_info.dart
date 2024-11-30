// Class to represent an individual's education
class Education {
  // Properties to store the education details
  final String logo;  // Path to the institution's logo (e.g., image asset path)
  final String name;  // Name of the institution (e.g., university name)
  final double gpa;   // GPA obtained at this institution

  // Constructor to initialize the Education object
  Education({
    required this.logo,  // The logo is required, must pass a string representing the image path
    required this.name,  // Name of the institution is required
    required this.gpa,   // GPA is required, and it must be a double value
  });
}

// Class to represent work experience
class WorkExperience {
  // Properties to store work-related information
  final String role;  // Job title or role in the company
  final String company;  // Name of the company or organization
  final String location;  // Location of the job (e.g., city, country)
  final String date;  // Date range of employment (e.g., "Jan 2021 - Dec 2022")
  final List<String> responsibilities;  // List of job responsibilities or key tasks

  // Constructor to initialize WorkExperience object
  WorkExperience({
    required this.role,  // The role is mandatory
    required this.company,  // Company name must be provided
    required this.location,  // Job location is required
    required this.date,  // Dates of employment are required
    required this.responsibilities,  // A list of responsibilities (at least one should be passed)
  });
}

// Class to represent details about a project
class ProjectInfo {
  // Properties to store project details
  final String title;  // Title of the project (e.g., project name)
  final String description;  // Short description of the project
  final List<String> images;  // List of image paths related to the project (e.g., screenshots or diagrams)

  // Constructor to initialize ProjectInfo object
  ProjectInfo({
    required this.title,  // Project title is mandatory
    required this.description,  // A project description is needed to give context
    required this.images,  // Images are required, even if it's an empty list
  });
}

// Main class to represent the entire user profile
class UserInfo {
  // Basic profile information
  final String name;  // User's full name
  final String position;  // User's current position (e.g., "Software Developer")
  final String company;  // The company or organization the user is associated with
  final String phone;  // User's phone number
  final String email;  // User's email address
  final String address1;  // Primary address (e.g., street address)
  final String address2;  // Secondary address (e.g., city, country)

  // Educational background, projects, skills, and work experience
  final List<Education> education;  // List of educational qualifications
  final List<ProjectInfo> projects;  // List of projects the user has worked on
  final List<String> technicalSkills;  // List of technical skills (e.g., programming languages, tools)
  final List<String> nonTechnicalSkills;  // List of soft skills (e.g., leadership, communication)
  final List<WorkExperience> workExperience;  // List of the user's previous work experiences

  // Constructor to initialize the entire UserInfo object
  UserInfo({
    required this.name,  // Full name is required
    required this.position,  // Position or title is required
    required this.company,  // The company or current organization is required
    required this.phone,  // Phone number is required
    required this.email,  // Email address is mandatory
    required this.address1,  // Primary address is needed
    required this.address2,  // Secondary address is also required
    required this.education,  // List of education must be provided, even if empty
    required this.projects,  // List of projects must be provided
    required this.technicalSkills,  // A list of technical skills is mandatory
    required this.nonTechnicalSkills,  // A list of non-technical skills is mandatory
    required this.workExperience,  // Work experience list is required, even if it's an empty list
  });
}
