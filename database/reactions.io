// база данных реакций и комментариев
// таблица posts находится в БД, описанной в файле posts.io
// таблица users находится в БД, описанной в файле users.io

// какими пользователями реакции добавлены к посту
Table post_reactions {
  post_id integer [not null, ref: > posts.id]
  user_id integer [not null, ref: > users.id]
  created_at timestamp

  indexes {
      (post_id, user_id) [pk] // составной первичный ключ
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