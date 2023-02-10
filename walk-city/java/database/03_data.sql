
-- insert users table data
INSERT INTO users (user_id, username,password_hash,role) VALUES (1, 'shawnbcool27', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id, username,password_hash,role) VALUES (2, 'admin', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (user_id, username,password_hash,role) VALUES (3, 'daniel', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (user_id, username,password_hash,role) VALUES (4, 'emma', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (user_id, username,password_hash,role) VALUES (5, 'patricia', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (user_id, username,password_hash,role) VALUES (6, 'hong', '$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
ALTER SEQUENCE seq_user_id RESTART WITH 7;

INSERT INTO locations(location_name, category, latitude, longitude, address, description, availability, image, social_media)
                VALUES ('Bistro Romano', 'Restaurant', '39.94206626554831', '-75.14471908832418', '120 Lombard St Society Hill, Philadelphia, PA 19147-1602', 'Bistro Romano, an Italian restaurant situated in an 18th century granary in historic Society Hill features innovative Italian cuisine, candlelit dining, surrounded by stone walls and old world charm.', 'Wed-Sun: 5PM-9PM', '', 'https://bistroromano.com'),
                       ('Reading Terminal Market', 'Restaurant', '39.95368517686304', '-75.1584975303445', '12th and Arch Sts., Philadelphia, PA 19107', 'One of America’s largest and oldest public markets, housed since 1893 in a National Historic Landmark building, the Market offers an incredible selection of locally grown & exotic produce, locally sourced meats and poultry, plus the finest seafood, cheeses, baked goods, and confections.', 'Open Daily: 8AM-6PM ', '', 'https://readingterminalmarket.org'),
                       ('Hershel''s East Side Deli', 'Restaurant', '39.95336626994465', '-75.15894030592109', '51 N 12th St, Philadelphia, PA 19107-2902', 'When you chomp into one of the piled-high Reuben or corned beef specials at Hershel’s, you’ll understand why locals refer to this place as “the best Jewish deli outside New York."', 'Mon-Sun: 8AM-6PM', '', 'http://hershelseastsidedeli.com/'),
                       ('The Original Turkey', 'Restaurant', '39.95367686838531', '-75.15849923129213', '45 N 12th St, Philadelphia, PA 19107-2902', 'Located inside Philly’s famed Reading Terminal Market since 1983, family owned-and-operated The Original Turkey does one thing and does it really, really well: turkey.', 'Open Daily: 9AM-6PM', '', 'https://theoriginalturkey.com'),
                       ('Dutch Eating Place', 'Restaurant', '39.95381119575545', '-75.15910643364624', '1136 Arch St, Philadelphia, PA 19107-2956', 'One of Reading Terminal Market’s most iconic eateries, this diner offers rib-sticking, Pennsylvania Dutch fare to take away or to enjoy at the counter, elbow-to-elbow with locals and visitors alike.', 'Tues-Wed: 8AM-3PM, Thur-Sat: 8AM-5PM', '', 'https://readingterminalmarket.org/merchant/dutch-eating-place'),
                       ('Zahav', 'Restaurant', '39.94623961600897', '-75.14501698993267', '237 St. James Place, Philadelphia, PA 19106-3936', 'Zahav brings the flavors of Israel''s cultural crossroads to Philadelphia. While Israeli Cuisine is in a constant state of evolution, the cooking at Zahav comes from a deep well of Israeli hospitality.', 'Tues-Sat: 5PM-9:30PM', '', 'https://zahavrestaurant.com'),
                       ('Vetri Cucina', 'Restaurant', '39.94672831319281', '-75.16318288649872', '1312 Spruce St, Philadelphia, PA 19107-5885', 'Vetri Cucina has the longstanding reputation as being one of the most respected and influential Italian restaurants in the country.', 'Open Daily: 5PM-9PM', '', 'https://vetricucina.com'),
                       ('The Franklin Fountain', 'Restaurant', '39.949666602987605', '-75.14286483272559', '116 Market St, Philadelphia, PA 19106-3099', 'A treatise on the history of ice-cream in Philadelphia.', 'Open Daily: 11AM-12AM', '', 'https://franklinfountain.com'),
                       ('Morimoto', 'Restaurant', '39.94965303675284', '-75.15327480654072', '723 Chestnut St, Philadelphia, PA 19106-2301', 'Masaharu Morimoto’s flagship restaurant serves as a showcase for the world-renowned chef’s exhilarating cuisine.', 'Open Daily: 5PM-10PM', '', 'https://morimotorestaurant.com'),
                       ('Amada', 'Restaurant', '39.94865408031911', '-75.14489384758846', '217-219 Chestnut St, Philadelphia, PA 19106-2812', 'Amada is Chef Garces'' iconic first restaurant. Since opening in 2005, the gorgeous rustic-chic restaurant and bar has embraced the rich traditions of Spanish cuisine.', 'Open Daily: 5PM-10PM', '', 'https://amadarestaurant.com'),
                       ('Eastern State Penitentiary', 'Museum', '39.968428331489925', '-75.1726519635302', '2027 Fairmount Avenue, Philadelphia, PA 19130', 'Eastern State Penitentiary was once the most famous and expensive prison in the world, but stands today in ruin, a haunting world of crumbling cellblocks and empty guard towers.', 'Open Daily: 10AM-5PM', '', 'https://easternstate.org'),
                       ('Philadelphia Museum of Art', 'Museum', '39.96563736586117', '-75.18094382087806', '2600 Benjamin Franklin Parkway, Philadelphia, PA 19130', 'The Philadelphia Museum of Art is the cultural heart of a great city.', 'Thurs-Mon: 10AM-5PM, Tues & Wed: Closed', '', 'https://philamuseum.org'),
                       ('Barnes Foundation', 'Museum', '39.96082413037876', '-75.1727753288147', '2025 Benjamin Franklin Parkway, Philadelphia, PA 19130', 'Philadelphia art collector Albert C. Barnes (1872–1951) chartered the Barnes in 1922 to teach people from all walks of life how to look at art.', 'Thurs-Mon: 11AM-5PM', '', 'https://barnesfoundation.org'),
                       ('Rodin Museum', 'Museum', '39.96207119949826', '-75.1739364444065', '2151 Benjamin Franklin Parkway, Philadelphia, PA 19130', 'The Rodin Museum offers a verdant, intimate setting in which to enjoy some of the world''s most renowned masterpieces of sculpture.', 'Fri-Mon: 10AM-5PM', '', 'https://rodinmuseum.org'),
                       ('Museum of the American Revolution', 'Museum', '39.94845187901328', '-75.14542210819751', '101 South Third Street, Philadelphia, PA 19106', 'The Museum of the American Revolution uncovers and shares compelling stories about the diverse people and complex events that sparked America''s ongoing experiment in liberty, equality, and self-government.', 'Open Daily: 10AM-5PM', '', 'https://amrevmuseum.org'),
                       ('Philadelphia''s Magic Gardens', 'Museum', '39.94297733411157', '-75.1593796883316', '1020 South Street, Philadelphia, PA 19147', 'Philadelphia''s Magic Gardens (PMG) inspires creativity and community engagement by educating the public about folk, mosaic, and visionary art. PMG preserves, interprets, and provides access to Isaiah Zagar''s unique mosaic art environment and his public murals.', 'Wed-Mon: 11AM-6PM', '', 'https://phillymagicgardens.org'),
                       ('The Franklin Institute', 'Museum', '39.95833242423493', '-75.17311967270254', '222 North 20th Street, Philadelphia, PA 19103', 'Since 1824, The Franklin Institute has been one of the world''s premier science organizations.', 'Mon-Sun: 9:30AM-5PM', '', 'https://fi.edu'),
                       ('Weitzman National Museum of American Jewish History', 'Museum', '39.95030768079381', '-75.148547557649', '101 S Independence Mall E, Philadelphia, PA 19106-2517', 'The museum''s core exhibition illustrates the stories of the American Jewish experience.', 'Fri-Sun: 10AM-5PM', '', 'https://theweitzman.org'),
                       ('National Constitution Center', 'Museum', '39.95374040671355', '-75.14912054745334', '525 Arch Street, Philadelphia, PA 19106', 'The National Constitution Center serves as America''s leading platform for constitutional education and debate.', 'Wed-Sun: 10AM-5PM', '', 'https://constitutioncenter.org'),
                       ('Please Touch Museum', 'Museum', '39.979693688715926', '-75.20909335790171', '4231 Avenue of the Republic Ave Memorial Hall, Philadelphia, PA 19131-3719', 'With two full floors of fun, engaging exhibits, children are empowered to pursue their curiosity and explore the wonder within their own imaginations.', 'Wed-Mon: 9AM-4:30PM, Tues: Closed', '', 'https://pleasetouchmuseum.org'),
                       ('Spin Philadelphia', 'Bar', '39.949152801147875', '-75.16593407839665', '211 S 15th St, Philadelphia, PA 19102', 'SPIN is the original ping pong social club, your offline social network, the only one that doesn’t require a membership. We encourage human connections through a game that transcends age, gender, and any boundaries.', 'Tues-Sat: 4PM-10PM, Sun & Mon: Closed', '', 'https://wearespin.com'),
                       ('Graffiti Bar', 'Bar', '39.949630027067435', '-75.16162711616221', '124 S 13th St, Sampan Restaurant, Philadelphia, PA 19107', 'Tucked into the rear of the restaurant on a private 30-seat open-air patio, Graffiti Bar debuted in April 2010. Serving the same acclaimed Asian food and drinks by Chef Schulson that have made Sampan instantly popular, it''s also a haven for sports fans, equipped with TVs behind the bar, and home to our daily Happy Hour.', 'Mon-Sun: 4PM-11PM', '',  'https://sampanphilly.com/graffiti-bar'),
                       ('Oscar''s Tavern', 'Bar', '39.95031625596711', '-75.16636531072712', '1524 Sansom St, Philadelphia, PA 19102', 'Very casual neighborhood bar in Center City.', 'Mon-Sun: 11:30AM-2AM', '', 'https://oscarstavernphiladelphia.mybistro.online/'),
                       ('Harper''s Garden', 'Bar', '39.95240409413879','-75.16981416722389', '31 S 18th St, Philadelphia, PA 19103', 'A contemporary bar and restaurant tucked away in Rittenhouse Square.', 'Mon-Sun: 10AM-12PM', '', 'https://harpersgardenphilly.com'),
                        ('Hop Sing Laundromat', 'Bar', '39.95584315916324', '75.1568923878864', '1029 Race St, Philadelphia, PA 19107', 'A speakeasies bar in the heart of the city.', 'Open Daily: 5PM-2AM (Next Day)', '', 'https://www.yelp.com/biz/hop-sing-laundromat-philadelphia'),
                       ('Attico Rooftop Lounge', 'Bar', '39.948783653206114', '-75.16350062781413', '219 S Broad St, Rooftop of Cambria Hotel, Philadelphia, PA 19107', 'A rooftop lounge in the heart of Philadelphia.', 'Wed-Sun: 4PM-10PM, Mon & Tues: Closed', '', 'https://atticorooftop.com'),
                       ('Prohibition Taproom', 'Bar', '39.96142930720149', '-75.15917226955403', '501 N 13th St Philadelphia, PA 19123', 'CASUAL GASTROPUB FEATURING CRAFT BEER & CIDER, CLASSIC COCKTAILS, & COMFORT FOOD RIGHT ON THE CORNER OF 13TH & BUTTONWOOD IN THE HEART OF PHILADELPHIA.', 'Mon-Sun: 4PM-12AM', '', 'https://prohibitiontaproom.com'),
                       ('Charlie was a sinner.', 'Bar', '39.949715900092855', '-75.16176087324155', '131 S 13th St, Philadelphia, PA 19107', 'Small places - Strong drinks', 'Sun-Thurs: 4PM-11PM, Fri-Sat: 4PM-2AM', '', 'https://charliewasasinner.com'),
                       ('City Tap House', 'Bar', '39.95622503631312', '-75.167456068531', '100 N18th St Logan Square, Philadelphia, PA 19103', 'With a wide, open bar, a huge selection of taps, an extremely readable draft list, and regional (dare we say exceptional) cuisine, our sudsy dream became a reality.', 'Mon-Sun: 10AM-12PM', '', 'https://citytap.com'),
                       ('Writer''s Block Rehab', 'Bar', '39.946557239469925', '-75.16253102971027', '1342 Cypress St, Philadelphia, PA 19107', 'Cafes, Lounges, Cocktail Bars', 'Sun-Thurs: 11AM-10PM, Fri-Sat: 11AM-2AM', '', 'https://writersblockrehabphiladelphia.bestcafes.online'),
                       ('Dilworth Park', 'Park', '39.95303672771862', ' -75.16468358547372', '1 S 15th St, Philadelphia, PA 19102', 'A beautifully appointed park with an interactive fountain, lush lawn and tree grove seating areas, which features a café.', 'Open daily', '', 'https://centercityphila.org/parks/dilworth-park'),
                       ('Franklin Square', 'Park', '39.95565913269925', '-75.15045219005147', '200 N 6th St, Philadelphia, PA 19106', 'Center City''s favorite playtime oasis with fun for all!', 'Thurs-Sun: 10AM-7PM', '', 'https://historicphiladelphia.org/franklin-square'),
                       ('Independence National Historical Park', 'Park', '39.94953002599691', '-75.14973280174965', 'Philadelphia, PA 19106', 'The park represents the founding ideals of the nation, and preserves national and international symbols of freedom and democracy, including Independence Hall and the Liberty Bell.  The Declaration of Independence and U.S. Constitution were both debated and signed inside Independence Hall, a UNESCO World Heritage Site.', 'Open daily: 9AM-5PM', '', 'https://nps.gov/inde/index.htm'),
                       ('Rittenshouse Square', 'Park', '39.94946257220593', '-75.1718699963332', '1800 Walnut St, Philadelphia, PA 19103', 'The Friends of Rittenhouse Square was created in 1976 to address the increasing gap between available city funding and the maintenance needs of Rittenhouse Square.', 'Open daily', '', 'https://friendsofrittenhouse.org'),
                       ('Washington Square', 'Park', '39.94703493600054', '-75.15239469978481', '210 W Washington Square, Philadelphia, PA 19106', 'Preserve American past.', 'Mon-Sun: 9AM-5PM', '', 'https://nps.gov/inde/learn/historyculture/places-washingtonsquare.htm'),
                       ('Race Street Pier & Cherry Street Pier', 'Park', '39.95314770446502', '-75.13880117092798', 'N Christopher Columbus Blvd, Philadelphia, PA 19106', 'The Pier, situated south of the Ben Franklin Bridge and just north of Cherry Street Pier, has an upper level with a grand sky promenade and a lower level for passive recreation and social gathering.', 'Open daily', '', 'https://delawareriverwaterfront.com/places/race-street-pier'),
                       ('Bartram''s Garden', 'Park', '39.93273989119536', '-75.21220147914573', '5400 Lindbergh Blvd., Philadelphia, PA 19143', 'Finding renewal with nature', 'Open daily: 9AM-5PM', '', 'https://bartramsgarden.org'),
                       ('Schuylkill Banks Boardwalk', 'Park', '39.946137553613354', '-75.18678068430417', 'Schuylkill Banks Boardwalk, Philadelphia, PA 19103', 'Philadelphia''s tidal Schuylkill River, Schuylkill Banks was transformed into a premier riverfront destination that connects diverse neighborhoods, providing safe recreation and alternative transportation.', 'Open daily', '', 'https://schuylkillbanks.org/projects/boardwalk'),
                       ('Love Park', 'Park', '39.954279118898285', '-75.16565330641352', 'Arch St, Philadelphia, PA 19102', 'Located in the heart of Center City, LOVE Park is a year-round destination for locals and visitors alike. The park features free games, live entertainment, and accessible green space. It’s a place to mingle—and on Wedding Wednesdays, to marry!', 'Open daily', '', 'https://locations.phila.gov/love-park/'),
                       ('Independence Blue Cross RiverRink', 'Park', '39.947946313051375', '-75.13973906326618', '101 S Christopher Columbus Blvd, Philadelphia, PA 19106', 'For 29 seasons, Independence Blue Cross RiverRink Winterfest has been Philadelphia''s favorite winter tradition on the Delaware River Waterfront, inviting visitors for a chance to indulge in flights of fancy under thousands of sparkling lights in a winter wonderland with spectacular views of the Delaware River. ', 'Mon-Thur: 1PM-11PM, Fri-Sun: 11AM-12AM', '', 'https://delawareriverwaterfront.com/places/blue-cross-riverrink-winterfest');


INSERT INTO badges (badge_name, description, badge_image)
                VALUES ('Urban Explorer', 'Visiting every location.', 'urban-frame'),
                       ('Bar Hopper', 'Visit 5 bars.', 'bar-frame'),
                       ('History Hoarder', 'Visit 5 museums.', 'museum-frame'),
                       ('Nature Lover', 'Visit 5 parks.', 'park-frame'),
                       ('Food Critic', 'Visit 5 restaurants.', 'restaurant-frame');

INSERT INTO check_in (check_in_id, user_id, location_id, check_in_time, is_checked_in)
                VALUES (20, 1, 39, '2023-02-08 16:29:31.267127', true),
                       (21, 1, 20, '2023-02-08 16:29:45.324574', true),
                       (23, 1, 3, '2023-02-08 16:29:48.541147', true),
                       (24, 1, 4, '2023-02-08 16:29:51.465719', true),
                       (25, 1, 35, '2023-02-08 16:29:56.330392', true),
                       (26, 1, 23, '2023-02-08 16:31:20.12164', true),
                       (27, 1, 28, '2023-02-08 16:31:22.863234', true),
                       (28, 1, 25, '2023-02-08 16:31:26.202292', true),
                       (29, 1, 26, '2023-02-08 16:31:29.863504', true),
                       (30, 1, 1, '2023-02-08 16:32:30.947159', true),
                       (31, 1, 2, '2023-02-08 16:35:11.441938', true),
                       (32, 1, 5, '2023-02-08 16:36:52.023585', true);

INSERT INTO user_badge (user_id, badge_id, earned_time)
                VALUES (1, 5, '2023-02-08 16:36:52.023585');

