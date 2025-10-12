// база данных постов
// таблица users находится в БД, описанной в файле users.io

Table posts {
  id integer [pk]
  user_id integer [not null, ref: > users.id]
  text varchar [not null]
  location varchar [not null]
  created_at timestamp
}

// справочник, содержащий картинки-реакции
Table reactions {
  id integer [pk]
  name varchar [not null]
  image bytea
}

// какие реакции и какими пользователями добавлены к посту
Table post_reactions {
  post_id integer [not null, ref: > posts.id]
  reaction_id integer [not null, ref: > reactions.id]
  user_id integer [not null, ref: > users.id]
  created_at timestamp

  indexes {
      (post_id, reaction_id, user_id) [pk] // составной первичный ключ
    }
}

Table comments {
  id integer [pk]
  text varchar [not null]
  user_id integer [not null, ref: > users.id]
  created_at timestamp
}

// комментарии, добавленные к посту
Table post_comments {
  post_id integer [not null, ref: > posts.id]
  comment_id integer [not null, unique, ref: > comments.id]
}