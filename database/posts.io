// база данных постов
// таблица users находится в БД, описанной в файле users.io

Table posts {
  id integer [pk]
  user_id integer [not null, ref: > users.id]
  text varchar [not null]
  location varchar [not null]
  created_at timestamp
}

// ссылки ведут на CDN
Table photos {
  id integer [pk]
  image_preview_url uri
  image_url uri
  created_at timestamp
}

// привязка фотографий к посту
Table post_photos {
  post_id integer [not null, ref: > posts.id]
  photo_id integer [not null, ref: > photos.id]

  indexes {
      (post_id, photo_id) [pk] // составной первичный ключ
    }
}

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