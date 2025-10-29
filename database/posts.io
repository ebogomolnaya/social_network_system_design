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