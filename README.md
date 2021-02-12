# NYCSchools


Coding Challenge: NYC Schools

App to display list of NYC schools and their corrsponding SAT scores. 

**Features : **

List all NYC Schools :

     Provided service call returns total of 440 schools name and details about the School. For our implementation purpose i have choosen below fields and displayed as part of our school list screen. 

     - dbn, school_name, overview_paragraph, website, phone_number, fax_number, school_email, primary_address_line_1, city, zip, state_code

     Implemented infite scroll tableview to load all 440 records, While scrolling down if we reached end of the screen, am checking the scroll positoin and offset y position of scrollview and calling service to fetch next set of records. Pulling 10 records at a time and concatenate with the existing records and refreshing the data. 


Backend datails: 

Sample URL :
      https://data.cityofnewyork.us/api/id/s3k6-pzi2.json?$select=`dbn`,`school_name`,`overview_paragraph`,`website`,`phone_number`,`fax_number`,'school_email','primary_address_line_1','city','zip','state_code'&$order=`:id`+ASC&$limit=15&$offset=10

     Request header: Generated app token is passed as part of the header.

     Sample Response : 
          [{"dbn":"02M139","school_name":"Stephen T. Mather Building Arts & Craftsmanship High School","boro":"M","overview_paragraph":"Are you hoping four years of high school will lead you to college, a challenging career, or both? Do you like projects, working with your hands, and learning by doing? How about field trips and exploring outdoors all year? Are you creative, inquisitive, action-oriented, responsible, a positive risk-taker, collaborative, and conscientious? At our school you will prepare for college and beyond through hands-on/minds-on learning and skills training. Partnered with the National Park Service (NPS), our school offers CTE pathways in the specialized building arts or landscape stewardship, all through the lens of historic preservation. You will build a strong academic foundation and learn solid trade skills, opening doors to a successful future.","website":"www.MatherHSNYC.org","phone_number":"212-399-3520","fax_number":"212-245-4669","school_email_1":"school_email","primary_address_line_1_1":"primary_address_line_1","city_1":"city","zip_1":"zip","state_code_1":"state_code"}]

     Please check the attached screen of NYC school list. 
     
     



