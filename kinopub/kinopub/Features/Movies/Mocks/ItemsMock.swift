//
//  ItemsMock.swift
//  kinopub
//
//  Created by Andrzej Wielski on 02.01.2023.
//

import KinopubApi

let mockItem = ItemInfo(
    id: 1,
    title: "Гром: Трудное детство",
    year: 2022,
    quality: 1080,
    plot: "Юный Игорь Гром ищет варианты срочно заработать большую сумму и ввязывается в сомнительную авантюру на пару с другом Игнатом. Тем временем его отец вместе с будущим начальником петербургской полиции Фёдором Прокопенко охотится за боссом криминального мира по прозвищу Анубис.",
    imdbRating: 11,
    kinopoiskRating: 10,
    rating: 5,
    posters: Posters(
        small: "https://cdn.service-kp.com/poster/item/small/85819.jpg",
        medium: "https://cdn.service-kp.com/poster/item/medium/85819.jpg",
        big: "https://cdn.service-kp.com/poster/item/big/85819.jpg",
        wide: "https://cdn.service-kp.com/poster/item/wide/85819.jpg"
    )
)

let mockMovieItem = MovieItem(
    id: 1,
    title: "Гром: Трудное детство",
    year: 2002,
    quality: 1080,
    plot: "Юный Игорь Гром ищет варианты срочно заработать большую сумму и ввязывается в сомнительную авантюру на пару с другом Игнатом. Тем временем его отец вместе с будущим начальником петербургской полиции Фёдором Прокопенко охотится за боссом криминального мира по прозвищу Анубис.",
    imdbRating: 11,
    kinopoiskRating: 10,
    rating: 5,
    posters: Posters(
        small: "https://cdn.service-kp.com/poster/item/small/85819.jpg",
        medium: "https://cdn.service-kp.com/poster/item/medium/85819.jpg",
        big: "https://cdn.service-kp.com/poster/item/big/85819.jpg",
        wide: "https://cdn.service-kp.com/poster/item/wide/85819.jpg"
    ),
    videos: [
        Video(
            id: 1,
            thumbnail: "https://cdn.service-kp.com/poster/item/wide/85819.jpg",
            tracks: 2,
            ac3: 1,
            watched: 0,
            watching: WatchingStatus(
                status: Status._0,
                time: Int64(3865)
            )
        )
    ]
)

let mockSerialEpisode = Episode()

let mockSerialSeason = Season(
    id: 1,
    number: 1,
    title: "Какой-то там сезон",
    episodes: [
        mockSerialEpisode,
        mockSerialEpisode,
        mockSerialEpisode,
        mockSerialEpisode,
        mockSerialEpisode,
        mockSerialEpisode,
        mockSerialEpisode,
        mockSerialEpisode,
        mockSerialEpisode,
    ]
)

let mockSerialItem = SerialItem(
    id: 1,
    title: "Уэнсдэй",
    year: 2022,
    cast:
    "Дженна Ортега, Гвендолин Кристи, Рики Линдхоум, Джейми МакШейн, Хантер Дуэн, Перси Хайнс Уайт, Эмма Майерс, Джой Сандай, Тора Бёрч, Джорджи Фармер, Наоми Танкел, Кристина Риччи, Джонна Диас-Уотсон, Оливер Уотсон, Victor Dorobantu",
    director: "Тим Бёртон, Джеймс Маршалл, Gandja Monteiro",
    duration: ItemInfoDuration(
        average: 2560.0,
        total: 25600.0
    ),
    quality: 2160,
    genres: [
        Genre(id: 1, title: "Комедия"),
        Genre(id: 2, title: "Фэнтези"),
        Genre(id: 3, title: "Семейный"),
        Genre(id: 4, title: "Детектив"),
        Genre(id: 4, title: "Криминал"),
        Genre(id: 4, title: "Эксклюзив")
    ],
    countries: [
        Country(id: 1, title: "США")
    ],
    plot: "Уэнсдэй, дочь Гомеса и Мортиши Аддамс, учится в академии Nevermore. Ей предстоит освоить экстрасенсорные способности, чтобы остановить местного серийного убийцу и раскрыть тайну родителей.",
    imdbRating: 8.3,
    kinopoiskRating: 8.2,
    rating: 9.5,
    finished: true,
    inWatchlist: true,
    subscribed: true,
    posters: Posters(
        small: "https://cdn.service-kp.com/poster/item/small/85036.jpg",
        medium: "https://cdn.service-kp.com/poster/item/medium/85036.jpg",
        big: "https://cdn.service-kp.com/poster/item/big/85036.jpg",
        wide: "https://cdn.service-kp.com/poster/item/wide/85036.jpg"
    ),
    trailer: ItemInfoTrailer(
        id: 85036,
        url: "https://cdn-azure.net/pd/aWQ9MTA2Mzc0OzE1ODYwNjAyODk7MjE2MjU1Njc7MDsxNjcyODQ3NzE0Jmg9Tzcwc09GWDhsQVNZMlMwNnl3WHktdyZlPTE2NzI5MzQxMTQ/trailers/b/a2/85036.mp4?loc=nl"
    ),
    seasons: [
        mockSerialSeason,
        mockSerialSeason
    ]
)
