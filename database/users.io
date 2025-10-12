// база данных пользователей

Table users {
  id integer [pk]
  username varchar [not null, unique]
  created_at timestamp
}

// подписки пользователя
Table follows {
  following_user_id integer [not null, ref: > users.id, note: 'Подписчик']
  followed_user_id integer [not null, ref: > users.id, note: 'Пользователь, на которого подписываются']
  created_at timestamp

  indexes {
        (following_user_id, followed_user_id) [pk] // составной первичный ключ
      }
}