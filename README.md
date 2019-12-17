# DB-Course-work
DB Course work

Create a tourist club database
Tourists who come to the tourist club can not only go on planned trips, but also engage in various sections throughout the year. To do this, they are recorded in groups associated with specific sections.
Tourists can be divided into amateurs, athletes and trainers. Each of these categories can have its own set of characteristics-attributes. Sections of the club are headed by managers, whose functions include monitoring the work of the section. The section is attended by trainers who administratively belong to one of the sections. The section leader appoints a trainer for each group. A coach can train several groups, and they do not necessarily belong to his section. Athletes and coaches can take part in various competitions.
Sections are scheduled annually. It indicates which training sessions will be conducted and in which sections: their number, place, time, etc. According to this, section managers carry out load balancing for trainers (taking into account their specialty). Information about the training and attendance of classes is collected by managers.
The club organizes various trips throughout the year. Each hike has its own route, which takes a certain number of days. The route and the number of days determines the category of difficulty of this trip. The hike is led by an instructor, which can be any trainer or athlete. He gains a group of 5-15 people for his hike, based on the type of hike (hiking, horseback, water, mountain) and the physical data of tourists (according to their occupations in sections: water walkers, cavers, climbers, etc., taking into account If you don’t know how to swim, then they’ll never take it for rafting, and any tourist can take a hike of a small complexity category). The instructor leads trips in this category of difficulty, only if he himself has already passed this trip.
Campaigns can be planned and unplanned. For each planned trip, there is an exact plan that indicates the route, the schedule of stops and parking for each day. During the planned campaign, a diary is kept. Unscheduled hikes have only a route and its total travel time. An unplanned trip can be transferred to the category of planned. Each tourist is assigned the category of the most difficult of the planned trips he has traveled.
Types of queries in the information system:
1. Get a list and the total number of tourists engaged in the club, in the indicated section, group, by gender, year of age.
2. Get a list and the total number of trainers of the specified section for all sections, by gender, by age, by size of wages, specialization.
3. Get a list and the total number of competitions in which athletes from the indicated section took part in all sections.
4. Get a list of trainers who conducted training in the specified group for the specified period of time.
5. To get a list and the total number of tourists from a certain section, groups that went on a given number of trips, went on a specified trip, went on a trip at a specified time, went on a certain route, have the corresponding category.
6. Get a list of section managers in full, by wage, by year of birth, age, year of employment.
7. Get the load of trainers (type of classes, number of hours), its volume for certain types of classes and the total load for a specified period of time for a given trainer or specified section.
8. Obtain a list and the total number of routes traveled by tourists from the indicated section, in the specified period of time, by which this instructor drove their groups, along which the indicated number of groups traveled.
9. Obtain a list and the total number of routes that pass through some point, have a length greater than the specified, can satisfy a given category of complexity.
10. Get a list and the total number of tourists from the indicated section, groups that can go on given types of hikes.
11. Get a list and total number of instructors, instru
athletes, trainers, trainers who have a certain category, who went on a specified number of trips, went on a certain trip, went on a certain route, were at the specified point.
12. Get a list of tourists from the indicated section, group, went hiking with their trainer as an instructor.
13. Get a list of tourists from a certain section, a group that went along all routes, according to specified routes.
