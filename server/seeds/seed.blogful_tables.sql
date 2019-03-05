BEGIN;

TRUNCATE
  blogful_comments,
  blogful_articles,
  blogful_users
  RESTART IDENTITY CASCADE;

-- $2a$12$.GA.05GnIPcPZf8WpCZbouNzinClxRljDeUEjwTUIxcEIphLAV4xq


INSERT INTO blogful_users (id, user_name, full_name, nickname, password)
VALUES
  (1, 'dunder', 'Dunder Mifflin', null, 'password'),
  (2, 'b.deboop', 'Bodeep Deboop', 'Bo', '$2a$12$e7Sc4gIcabuQ.cl0jJQjteLGusf4sY4Euszh8VmLFuQFi6yOXGvNy'),
  (3, 'c.bloggs', 'Charlie Bloggs', 'Charlie', '$2a$12$jGKOlUVQhe/r21tg.axq8us20ynbVNe4jYchurohoG2HPrRowK1GC'),
  (4, 's.smith', 'Sam Smith', 'Sam', '$2a$12$yfA8Q5HmJWGE8F.ORvF..uib/DwgXABwg0uB20f9X2evQj9YZP.6O'),
  (5, 'lexlor', 'Alex Taylor', 'Lex', '$2a$12$0uBMgmMc9KuxaQWTcPSIzuP5/7VkFbLoJ6G5FOtcty8BhhJ49aG6.'),
  (6, 'wippy', 'Ping Won In', 'Ping', '$2a$12$ntGOlTLG5nEXYgDVqk4bPejBoJP65HfH2JEMc1JBpXaVjXo5RsTUu');

INSERT INTO blogful_articles (id, title, style, author_id, content)
VALUES
  (1, 'First post!', 'Interview', 1,
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus consequuntur deserunt commodi, nobis qui inventore corrupti iusto aliquid debitis unde non. Adipisci, pariatur. Molestiae, libero esse hic adipisci autem neque?'),
  (2, 'Second post!', 'How-to', 2,
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum, exercitationem cupiditate dignissimos est perspiciatis, nobis commodi alias saepe atque facilis labore sequi deleniti. Sint, adipisci facere! Velit temporibus debitis rerum.'),
  (3, 'Third post!', 'News', 3,
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus, voluptate? Necessitatibus, reiciendis? Cupiditate totam laborum esse animi ratione ipsa dignissimos laboriosam eos similique cumque. Est nostrum esse porro id quaerat.'),
  (4, 'Fourth post', 'How-to', 4,
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero, consequuntur. Cum quo ea vero, fugiat dolor labore harum aut reprehenderit totam dolores hic quaerat, est, quia similique! Aspernatur, quis nihil?'),
  (5, 'Fifth post', 'News', 5,
    'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Amet soluta fugiat itaque recusandae rerum sed nobis. Excepturi voluptas nisi, labore officia, nobis repellat rem ab tempora, laboriosam odio reiciendis placeat?'),
  (6, 'Sixth post', 'Listicle', 6,
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
  (7, 'Seventh post', 'Listicle', 1,
    'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed, voluptatum nam culpa minus dolore ex nisi recusandae autem ipsa assumenda doloribus itaque? Quos enim itaque error fuga quaerat nesciunt ut?'),
  (8, 'Eigth post', 'News', 2,
    'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Consequatur sequi sint beatae obcaecati voluptas veniam amet adipisci perferendis quo illum, dignissimos aspernatur ratione iusto, culpa quam neque impedit atque doloribus!'),
  (9, 'Ninth post', 'Story', 3,
    'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos architecto repellat, in amet soluta exercitationem perferendis eius perspiciatis praesentium voluptate nisi deleniti eaque? Rerum ea quisquam dolore, non error earum?'),
  (10, 'Tenth post', 'How-to', 4,
    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum molestiae accusamus veniam consectetur tempora, corporis obcaecati ad nisi asperiores tenetur, autem magnam. Iste, architecto obcaecati tenetur quidem voluptatum ipsa quam?');

INSERT INTO blogful_comments (
  id,
  text,
  article_id,
  user_id
) VALUES
  (
    1,
    'This post is amazing',
    1,
    2
  ),
  (
    2,
    'Yeh I agree it''s amazing',
    1,
    3
  ),
  (
    3,
    'I would go so far as to say it''s double amazing',
    1,
    4
  ),
  (
    4,
    'A-mazing!',
    1,
    5
  ),
  (
    5,
    'That''s some interesting lorem''s you raise',
    2,
    6
  ),
  (
    6,
    'Yeh totally I''d never thought about lorem''s like that before',
    2,
    1
  ),
  (
    7,
    'So you''re saying consectetur adipisicing elit?',
    2,
    3
  ),
  (
    8,
    'Sixth? You mean sith?!!',
    4,
    6
  ),
  (
    9,
    'What do you call an evil procrastinator? Darth Later! Hahahahaha!',
    4,
    4
  ),
  (
    10,
    'Ten ten ten ten ten ten ten!',
    10,
    3
  ),
  (
    11,
    'Iste, architecto obcaecati tenetur quidem voluptatum ipsa quam!!!',
    10,
    5
  ),
  (
    12,
    '5, 6, 7, 8! My boot-scootin'' baby is drivin'' me crazy...!',
    7,
    1
  ),
  (
    13,
    'My obsession from a western! My dance floor date',
    7,
    2
  ),
  (
    14,
    'My rodeo Romeo. A cowboy god from head to toe',
    7,
    3
  ),
  (
    15,
    'Wanna make you mine. Better get in line. 5, 6, 7, 8!',
    7,
    4
  ),
  (
    16,
    'Just a lonely comment',
    9,
    6
  ),
  (
    17,
    'Really? Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris??!',
    6,
    5
  ),
  (
    18,
    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris for sure!!',
    6,
    1
  ),
  (
    19,
    'WOAH!!!!!',
    8,
    2
  ),
  (
    20,
    '°º¤ø,¸¸,ø¤º°`°º¤ø,¸,ø¤°º¤ø,¸¸,ø¤º°`°º¤ø,¸',
    8,
    4
  );

COMMIT;
