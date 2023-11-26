# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create([
               { imdb_id: '1', title: 'Oppenheimer', rating: 8.5, rank: 10, year: 2023 },
               { imdb_id: '2', title: 'Elemental', rating: 7, rank: 12, year: 2023 },
               { imdb_id: '3', title: 'Blue beetle', rating: 6.2, rank: 15, year: 2023 },
               { imdb_id: '4', title: 'The Nun 2', rating: 5.8, rank: 23, year: 2023 },
               { imdb_id: '5', title: 'The Exorcist', rating: 8.9, rank: 48, year: 1973 },
               { imdb_id: '6', title: 'Pulp fiction', rating: 8.1, rank: 8, year: 1994 },
               { imdb_id: '7', title: 'The Good, the Bad and the Ugly', rating: 8.8, rank: 11, year: 1966 },
               { imdb_id: '8', title: 'Fight Club', rating: 8, rank: 14, year: 1999 },
               { imdb_id: '9', title: 'Inception', rating: 8.8, rank: 16, year: 2010 },
               { imdb_id: '10', title: 'Se7en', rating: 8.6, rank: 19, year: 1995 },
               { imdb_id: '11', title: 'The Silent of the Lambs', rating: 8.6, rank: 24, year: 1991 },
               { imdb_id: '12', title: 'The Back to the Future', rating: 8.5, rank: 31, year: 1985 }
             ])

User.create([
              { name: 'user1', password: '12345678', password_confirmation: '12345678', email: 'user1@email.com',
                role: 'user', active: true },
              { name: 'admin', password: '87654321', password_confirmation: '87654321', email: 'admin@email.com',
                role: 'admin', active: true }
            ])
