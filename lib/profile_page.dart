import 'package:flutter/material.dart';
import 'user_info.dart';

// Main content widget for the profile page
class ProfilePageContent extends StatelessWidget {
  final UserInfo userInfo;

  const ProfilePageContent({super.key, required this.userInfo});

  // Optional: BuildContext getter, but unused in the current setup
  BuildContext? get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar shows the user's name as the title
      appBar: AppBar(title: Text(userInfo.name)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Build sections: Profile, Education, Projects, Skills, Work Experience, Contact
          _buildProfileSection(),
          const SizedBox(height: 20),
          _buildEducationSection(),
          const SizedBox(height: 20),
          _buildProjectsSection(),
          const SizedBox(height: 20),
          _buildSkillsSection(), 
          const SizedBox(height: 20),
          _buildWorkExperienceSection(),  // Added Work Experience Section
          const SizedBox(height: 20),
          _buildContactSection(),
        ],
      ),
    );
  }

  // Builds the Work Experience section with cards showing each job's details
  Widget _buildWorkExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        const Text(
          'Work Experience',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        // Maps over workExperience list to create a card for each job
        ...userInfo.workExperience.map((experience) => Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Job role (position)
                Text(
                  experience.role,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                // Company name and location
                Text('${experience.company} - ${experience.location}'),
                const SizedBox(height: 8),
                // Responsibilities header
                const Text('Responsibilities:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                // Maps over the responsibilities list to display each responsibility with a bullet point
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: experience.responsibilities.map((resp) => Text('- $resp')).toList(),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }

  // Builds the Skills section (both technical and non-technical) using chips for each skill
  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title for Technical Skills
        Text('Technical Skills', style: Theme.of(context!).textTheme.titleLarge),
        const SizedBox(height: 10),
        // Uses a Wrap widget to arrange the skill chips
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          // Maps over technical skills list to create chips for each skill
          children: userInfo.technicalSkills
              .map((skill) => Chip(
                    label: Text(skill),
                    backgroundColor: Colors.tealAccent.shade100,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ))
              .toList(),
        ),
        const SizedBox(height: 20),
        // Section title for Non-Technical Skills
        Text('Non-Technical Skills', style: Theme.of(context!).textTheme.titleLarge),
        const SizedBox(height: 10),
        // Uses a Wrap widget to arrange the non-technical skill chips
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          // Maps over non-technical skills list to create chips for each skill
          children: userInfo.nonTechnicalSkills
              .map((skill) => Chip(
                    label: Text(skill),
                    backgroundColor: Colors.orangeAccent.shade100,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ))
              .toList(),
        ),
      ],
    );
  }

  // Builds the Profile section, showing the user's avatar, name, position, and contact info
  Widget _buildProfileSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile picture
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        const SizedBox(height: 16),
        // User's name
        Text(
          userInfo.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // User's position and company
        Text(
          '${userInfo.position} at ${userInfo.company}',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        // Contact details: Phone, Email, Address
        Text(
          'Phone: ${userInfo.phone}',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'Email: ${userInfo.email}',
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'Address: ${userInfo.address1}, ${userInfo.address2}',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // Builds the Education section, showing each institution's logo, name, and GPA
  Widget _buildEducationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        const Text(
          'Education',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        // Maps over education list to create a card for each institution
        ...userInfo.education.map((edu) => Card(
          child: ListTile(
            leading: Image.asset(edu.logo, width: 50), // Institution logo
            title: Text(edu.name), // Institution name
            subtitle: Text('GPA: ${edu.gpa}'), // GPA
          ),
        )),
      ],
    );
  }

  // Builds the Projects section, displaying projects in a grid layout
  Widget _buildProjectsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        const Text(
          'Projects',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        // Uses GridView.builder to display projects in a grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: userInfo.projects.length,
          itemBuilder: (context, index) {
            final project = userInfo.projects[index];
            return Card(
              child: Column(
                children: [
                  // Project image (or default image if not available)
                  Image.asset(
                    project.images.isNotEmpty ? project.images[0] : 'assets/images/default-image.png',
                    fit: BoxFit.cover,
                    height: 100,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      project.title, // Project title
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(project.description), // Project description
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // Builds the Contact section, showing the user's phone and email
  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        const Text(
          'Contact',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        // Contact details: Phone, Email
        Text('Phone: ${userInfo.phone}'),
        Text('Email: ${userInfo.email}'),
      ],
    );
  }
}
