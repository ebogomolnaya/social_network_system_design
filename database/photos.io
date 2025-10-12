// база данных фотографий
// таблица posts находится в БД, описанной в файле posts.io

Table photos {
  id integer [pk]
  image bytea [not null]
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