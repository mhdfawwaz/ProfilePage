import 'package:flutter/material.dart';
import 'user_info.dart';

void main() {
  // The entry point of the application
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    // The main structure of the application with Material Design
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: ProfilePage(), // Set the home widget to ProfilePage
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define user info here or fetch it from an external source
    UserInfo userInfo = UserInfo(
      name: 'Fawwaz Uddin Mohammed', // User's name
      position: 'Graduate Student', // User's current position
      company: 'Illinois Tech', // User's institution
      phone: '(312) 111-1212', // User's phone number
      email: 'fmohammed6@hawk.iit.edu', // User's email
      address1: '400 E 33rd St', // User's address line 1
      address2: 'Chicago, IL 60616', // User's address line 2
      education: [ // List of user education details
        Education(
          logo: 'assets/images/iit.png', // Logo of the institution
          name: 'Illinois Tech', // Name of the institution
          gpa: 3.8, // User's GPA
        ),
        Education(
          logo: 'assets/images/cbit.jpeg', // Logo of the institution
          name: 'Chaitanya Bharathi Institute of Technology', // Name of the institution
          gpa: 3.55, // User's GPA
        ),
      ],
      projects: [ // List of user projects
        ProjectInfo(
          title: 'E-commerce Platform', // Title of the project
          description: 'Developed a scalable e-commerce platform using Spring Boot and AngularJS.', // Brief description of the project
          images: ['assets/images/ecom.png'], 
        ),
        ProjectInfo(
          title: 'Social Media', // Title of the project
          description: 'Developed a high-performance Java-based backend system for social media comment posting, capable of handling 10,000+ users with 99.9% uptime', // Brief description
          images: ['assets/images/social.jpg'], 
        ),
        ProjectInfo(
          title: 'Music Management', // Title of the project
          description: 'Developed a high-performance Java-based backend system for social media comment posting, capable of handling 10,000+ users with 99.9% uptime.', // Brief description
          images: ['assets/images/music.jpg'],
        ),
        ProjectInfo(
          title: 'Cycle shop', // Title of the project
          description: 'Designed and developed a high-performance RESTful API using Spring Boot 2.5 for managing inventory and sales operations in a cycle shop, resulting in a 30% increase in operational efficiency', // Brief description
          images: ['assets/images/cycle.jpg'], 
        ),
      ],
      technicalSkills: [ // List of technical skills
        'Java',
        'Flutter',
        'Spring Boot',
        'Python',
        'AngularJS',
      ],
      nonTechnicalSkills: [ // List of non-technical skills
        'Team Leadership',
        'Communication',
        'Project Management',
        'Problem-Solving',
      ],
      workExperience: [ // List of work experience entries
        WorkExperience(
          role: 'Graduate Student Ambassador', // Job title
          company: 'Illinois Tech', // Company name
          location: 'Chicago, United States', // Location of the job
          date: 'Sep 2024 - Present', // Duration of the employment
          responsibilities: [ // List of responsibilities
            'Managed and responded to 50+ emails weekly, ensuring prompt communication with prospective students, achieving a 98% email completion rate within 24 hours',
            'Processed 120+ applications monthly, streamlining data organization to enhance the efficiency of the admissions process by 30%',
            'Spearheaded call campaigns with a 25% engagement rate, contributing to a 10% increase in Graduate Admission outreach and recruitment',
          ],
        ),
        WorkExperience(
          role: 'Associate Software Engineer Intern', // Job title
          company: 'Prodapt', // Company name
          location: 'Hyderabad, India', // Location of the job
          date: 'Jul 2023 - Dec 2023', // Duration of the employment
          responsibilities: [ // List of responsibilities
            'Engineered and optimized seamless front-end to back-end communication by implementing RESTful APIs using NodeJS and Java Spring Boot, reducing API response times by 40%',
            'Demonstrated technical prowess through the completion of 25+ projects, leveraging expertise in Spring Boot, Angular, and JWT authentication, resulting in a 30% increase in development productivity',
            'Implemented Junit testing methods, resolving over 1800+ code duplication issues, increasing code coverage from 65% to 92% and ensuring code quality through SonarQube',
          ],
        ),
      ],
    );

  return Scaffold(
  appBar: AppBar(
    title: Text(userInfo.name), // Displaying the user's name as the title
    backgroundColor: Colors.teal, // Setting the app bar color
  ),
  body: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Section 1: My Profile Info
        Padding(
          padding: const EdgeInsets.all(16.0), // Adding padding around the profile section
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50, // Profile picture size
                backgroundImage: AssetImage('assets/images/profile.jpg'), // Profile image asset
              ),
              const SizedBox(height: 10), // Space between avatar and name
              Text(
                userInfo.name, // Displaying user's name
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Name styling
              ),
              Text(userInfo.position), // Displaying user's position
              Text(userInfo.company), // Displaying user's company
              Text(userInfo.phone), // Displaying user's phone number
              Text(userInfo.email), // Displaying user's email
              Text(userInfo.address1), // Displaying user's address line 1
              Text(userInfo.address2), // Displaying user's address line 2
            ],
          ),
        ),
        const Divider(), // Adding a divider for separation

        // Section 2: My Education
        Padding(
          padding: const EdgeInsets.all(8.0), // Adding padding around education section
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligning text to start
            children: [
              const Text(
                "Education", // Section title
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Title styling
              ),
              const SizedBox(height: 10), // Space before education entries
              Row(
                children: [
                  Image.asset(userInfo.education[0].logo, width: 50), // First education logo
                  const SizedBox(width: 10), // Space between logo and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligning text to start
                    children: [
                      Text(userInfo.education[0].name), // School name
                      Text('GPA: ${userInfo.education[0].gpa}'), // Displaying GPA
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10), // Space between education entries
              Row(
                children: [
                  Image.asset(userInfo.education[1].logo, width: 50), // Second education logo
                  const SizedBox(width: 10), // Space between logo and text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligning text to start
                    children: [
                      Text(userInfo.education[1].name), // School name
                      Text('GPA: ${userInfo.education[1].gpa}'), // Displaying GPA
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(), // Adding a divider for separation

        // Section 3: My Work Experience with Dropdown
        Padding(
          padding: const EdgeInsets.all(8.0), // Adding padding around work experience section
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligning text to start
            children: [
              const Text(
                "Work Experience", // Section title
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Title styling
              ),
              const SizedBox(height: 10), // Space before work experience entries
              // Looping through each work experience to create an ExpansionTile
              for (var work in userInfo.workExperience) ...[
                ExpansionTile(
                  title: Text(
                    '${work.role}, ${work.company}', // Displaying role and company
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Title styling
                  ),
                  subtitle: Text(work.date), // Displaying work duration
                  children: [
                    Text(work.location), // Displaying work location
                    const SizedBox(height: 5), // Space before responsibilities
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Aligning text to start
                      children: work.responsibilities.map((responsibility) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0), // Space between responsibilities
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start, // Aligning bullet point and text
                            children: [
                              const Text('• ', style: TextStyle(fontSize: 16)), // Bullet point
                              Expanded(
                                child: Text(responsibility, style: const TextStyle(fontSize: 16)), // Responsibility text
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 15), // Space after the list of responsibilities
                  ],
                ),
              ],
            ],
          ),
        ),
        const Divider(), // Adding a divider for separation

            // Section 4: My Technical and Non Technical Skills Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Skills",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      // Technical Skills Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Technical Skills",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            for (var skill in userInfo.technicalSkills) ...[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.code, color: Colors.teal),
                                    const SizedBox(width: 5),
                                    Text(skill, style: const TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      // Non-Technical Skills Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Non-Technical Skills",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            for (var skill in userInfo.nonTechnicalSkills) ...[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.group, color: Colors.teal),
                                    const SizedBox(width: 5),
                                    Text(skill, style: const TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(),

            // Section 5: Projects (Grid view)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Projects",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: userInfo.projects.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.teal[50],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 3),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: Image.asset(
                                userInfo.projects[index].images[0],
                                fit: BoxFit.cover,
                                height: 80,
                                width: double.infinity,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    userInfo.projects[index].title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(userInfo.projects[index].description),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
