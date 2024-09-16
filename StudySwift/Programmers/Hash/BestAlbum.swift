//
//  BestAlbum.swift
//  StudySwift
//
//  Created by nylah.j on 9/15/24.
//

import Foundation

final class BestAlbum {
    func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
        // 장르별로 가장 많이 재생된 노래 2곡
        // 1. 가장 많은 재생수를 가진 장르 -> genre - 총 Play 수
        // 2. 장르 내에서 가장 많이 재생된 노래  genre -> index
        // 3. 재생횟수가 같닺면 고유 번호가 낮은 노래  plays[index]를 가지고 정렬
//        (genre, [index] [plays])
//        -> 장르 개수
        // genre: [index] -> plays[index] 총합을 가지고 정렬한다.
        
        let genreToIndex: [String:[Int]] = genres.enumerated()
            .map({
                (genre: $0.element, index: $0.offset)
            })
            .reduce(into: [String : [Int]]()) { partialResult, genreIndex in
                partialResult[genreIndex.genre, default: []] += [genreIndex.index]
            }
            
        let sortedGenre: [String] = genreToIndex.keys.sorted {
            let leftGerneCount: Int = genreToIndex[$0]!.reduce(into: 0) { partialResult, index in
                partialResult += plays[index]
            }
            let rightGerneCount: Int = genreToIndex[$1]!.reduce(into: 0) { partialResult, index in
                partialResult += plays[index]
            }
            return leftGerneCount > rightGerneCount
        }
        
        return sortedGenre.map { genre in
            let ids = genreToIndex[genre]?.sorted(by: {
                plays[$0] > plays[$1]
            }) ?? []
            return ids.count >= 2 ? ids[0..<2] : [ids.first!]
        }.flatMap { (ids: ArraySlice<Int>) in
            ids
        }
    }
    
    func solution2(_ genres:[String], _ plays:[Int]) -> [Int] {
        var genreDict: [String:GenreInfo] = [:]
        
        zip(genres, plays)
            .enumerated()
            .map { (id: Int, genrePlay) in
                let (genre, play) = genrePlay
                return Song(id: id, genre: genre, count: play)
            }.forEach { (song: Song) in
                if let genre = genreDict[song.genre] {
                    let count = genre.count + song.count
                    var songs = genre.songs + [song]
                    songs.sort { $0.count > $1.count } // 시간복잡도 줄일 포인트
                    genreDict[song.genre]  = GenreInfo(title: song.genre, count: count, songs: songs)
                } else {
                    genreDict[song.genre]  = GenreInfo(title: song.genre, count: song.count, songs: [song])
                }
            }
        
       return  genreDict.values.sorted {
            $0.count > $1.count
        }.reduce(Array<Int>()) { partialResult, genreInfo in
            let twoSongs = genreInfo.songs.count >= 2 ? genreInfo.songs[0...1] : genreInfo.songs[0...0]
            let ids = twoSongs.map { $0.id }
            return partialResult + ids
        }
    }
    
    struct GenreInfo: Hashable {
        static func == (lhs: BestAlbum.GenreInfo, rhs: BestAlbum.GenreInfo) -> Bool {
            lhs.title == rhs.title
            && lhs.count == rhs.count
            && lhs.songs == rhs.songs
        }
        
        let title: String
        let count: Int
        let songs: [Song]
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(title)
        }
    }
    
    struct Song: Equatable {
        let id: Int
        let genre: String
        let count: Int
    }
    
    static func test() {
        let genres = ["classic", "pop", "classic", "classic", "pop"]
        let plays = [500, 600, 150, 800, 2500]
        let result = BestAlbum().solution2(genres, plays)
        print(result)
    }
}
