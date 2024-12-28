import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:movies/data/models/server_error_model.dart';

import '../../dependency_injection/dependency_injection.dart';
import '../../domain/use_cases/local/local_use_case.dart';
import 'api_constants.dart';
import 'app_exceptions.dart';

class ApiServices {
  final BaseOptions _options = BaseOptions(
    baseUrl: ApiConstants.baseURL,
  );

  dynamic get(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool hideError = false,
  }) async {
    _options.headers = await getHeader();
    final dio = Dio(_options);
    try {
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        return {
          "status": "ok",
          "status_message": "Query was successful",
          "data": {
            "movie_count": 64600,
            "limit": 20,
            "page_number": 1,
            "movies": [
              {
                "id": 65733,
                "url":
                    "https://yts.mx/movies/forbidden-knowledge-prophecies-portals-and-time-machines-2023",
                "imdb_code": "tt29335715",
                "title":
                    "Forbidden Knowledge: Prophecies, Portals and Time Machines",
                "title_english":
                    "Forbidden Knowledge: Prophecies, Portals and Time Machines",
                "title_long":
                    "Forbidden Knowledge: Prophecies, Portals and Time Machines (2023)",
                "slug":
                    "forbidden-knowledge-prophecies-portals-and-time-machines-2023",
                "year": 2023,
                "rating": 8.4,
                "runtime": 75,
                "genres": ["Documentary"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "",
                "language": "en",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/forbidden_knowledge_prophecies_portals_and_time_machines_2023/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/forbidden_knowledge_prophecies_portals_and_time_machines_2023/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/forbidden_knowledge_prophecies_portals_and_time_machines_2023/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/forbidden_knowledge_prophecies_portals_and_time_machines_2023/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/forbidden_knowledge_prophecies_portals_and_time_machines_2023/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/9C0F9E848C5E4CA37E0216774B902687B4A07DE3",
                    "hash": "9C0F9E848C5E4CA37E0216774B902687B4A07DE3",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "669.31 MB",
                    "size_bytes": 701822403,
                    "date_uploaded": "2024-12-28 01:21:37",
                    "date_uploaded_unix": 1735345297
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/9BA712CB7D1A2ABF0389DBADDB566BFDDAA0188D",
                    "hash": "9BA712CB7D1A2ABF0389DBADDB566BFDDAA0188D",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "1.21 GB",
                    "size_bytes": 1299227607,
                    "date_uploaded": "2024-12-28 02:15:39",
                    "date_uploaded_unix": 1735348539
                  }
                ],
                "date_uploaded": "2024-12-28 01:21:37",
                "date_uploaded_unix": 1735345297
              },
              {
                "id": 65732,
                "url":
                    "https://yts.mx/movies/balladen-om-mestertyven-ole-hoiland-1970",
                "imdb_code": "tt0155525",
                "title": "Balladen om mestertyven Ole Høiland",
                "title_english": "Balladen om mestertyven Ole Høiland",
                "title_long": "Balladen om mestertyven Ole Høiland (1970)",
                "slug": "balladen-om-mestertyven-ole-hoiland-1970",
                "year": 1970,
                "rating": 5.9,
                "runtime": 104,
                "genres": ["Adventure", "Biography", "Comedy", "Drama"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "",
                "language": "no",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/balladen_om_mestertyven_ole_hoiland_1970/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/balladen_om_mestertyven_ole_hoiland_1970/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/balladen_om_mestertyven_ole_hoiland_1970/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/balladen_om_mestertyven_ole_hoiland_1970/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/balladen_om_mestertyven_ole_hoiland_1970/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/63621B4C684EFADECE611C28C5EB82177EAABFF4",
                    "hash": "63621B4C684EFADECE611C28C5EB82177EAABFF4",
                    "quality": "720p",
                    "type": "bluray",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "964.01 MB",
                    "size_bytes": 1010837750,
                    "date_uploaded": "2024-12-28 00:53:18",
                    "date_uploaded_unix": 1735343598
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/FB79C17247820C9163F9F734AFE0E63E641EDAF8",
                    "hash": "FB79C17247820C9163F9F734AFE0E63E641EDAF8",
                    "quality": "1080p",
                    "type": "bluray",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "1.75 GB",
                    "size_bytes": 1879048192,
                    "date_uploaded": "2024-12-28 02:13:38",
                    "date_uploaded_unix": 1735348418
                  }
                ],
                "date_uploaded": "2024-12-28 00:53:18",
                "date_uploaded_unix": 1735343598
              },
              {
                "id": 65731,
                "url":
                    "https://yts.mx/movies/benidorm-10-years-on-holiday-2018",
                "imdb_code": "tt7949540",
                "title": "Benidorm: 10 Years on Holiday",
                "title_english": "Benidorm: 10 Years on Holiday",
                "title_long": "Benidorm: 10 Years on Holiday (2018)",
                "slug": "benidorm-10-years-on-holiday-2018",
                "year": 2018,
                "rating": 7.5,
                "runtime": 60,
                "genres": ["Documentary"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "",
                "language": "en",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/benidorm_10_years_on_holiday_2018/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/benidorm_10_years_on_holiday_2018/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/benidorm_10_years_on_holiday_2018/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/benidorm_10_years_on_holiday_2018/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/benidorm_10_years_on_holiday_2018/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/E42CFA16157228C5A69DFF8FFF749DFFB92EE554",
                    "hash": "E42CFA16157228C5A69DFF8FFF749DFFB92EE554",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "422.86 MB",
                    "size_bytes": 443400847,
                    "date_uploaded": "2024-12-28 02:33:56",
                    "date_uploaded_unix": 1735349636
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/26CDE97F9E9CA6176429EDC9DAD5A02DD02614AB",
                    "hash": "26CDE97F9E9CA6176429EDC9DAD5A02DD02614AB",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "783.25 MB",
                    "size_bytes": 821297152,
                    "date_uploaded": "2024-12-28 03:05:52",
                    "date_uploaded_unix": 1735351552
                  }
                ],
                "date_uploaded": "2024-12-28 02:33:56",
                "date_uploaded_unix": 1735349636
              },
              {
                "id": 65730,
                "url": "https://yts.mx/movies/purgatory-station-2024",
                "imdb_code": "tt19898834",
                "title": "Purgatory Station",
                "title_english": "Purgatory Station",
                "title_long": "Purgatory Station (2024)",
                "slug": "purgatory-station-2024",
                "year": 2024,
                "rating": 3.2,
                "runtime": 109,
                "genres": ["Thriller"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "ZT6DjMz1hE4",
                "language": "en",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/purgatory_station_2024/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/purgatory_station_2024/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/purgatory_station_2024/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/purgatory_station_2024/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/purgatory_station_2024/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/18F771A1ECCE4AEFCFB31EB97ACA19A04AE6FA84",
                    "hash": "18F771A1ECCE4AEFCFB31EB97ACA19A04AE6FA84",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 100,
                    "peers": 35,
                    "size": "995.45 MB",
                    "size_bytes": 1043804979,
                    "date_uploaded": "2024-12-27 19:34:29",
                    "date_uploaded_unix": 1735324469
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/F7ADEDEC8624F5840A40F09346F192C336FC4598",
                    "hash": "F7ADEDEC8624F5840A40F09346F192C336FC4598",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "5.1",
                    "seeds": 0,
                    "peers": 0,
                    "size": "2 GB",
                    "size_bytes": 2147483648,
                    "date_uploaded": "2024-12-27 20:36:15",
                    "date_uploaded_unix": 1735328175
                  }
                ],
                "date_uploaded": "2024-12-27 19:34:29",
                "date_uploaded_unix": 1735324469
              },
              {
                "id": 65727,
                "url": "https://yts.mx/movies/33-postcards-2010",
                "imdb_code": "tt1704161",
                "title": "33 Postcards",
                "title_english": "33 Postcards",
                "title_long": "33 Postcards (2010)",
                "slug": "33-postcards-2010",
                "year": 2010,
                "rating": 6.1,
                "runtime": 97,
                "genres": ["Crime", "Drama", "Music"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "a88tpwd8x5E",
                "language": "en",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/33_postcards_2010/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/33_postcards_2010/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/33_postcards_2010/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/33_postcards_2010/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/33_postcards_2010/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/98E6CD3EE173314BA637B50F4DE942418A897590",
                    "hash": "98E6CD3EE173314BA637B50F4DE942418A897590",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "891.74 MB",
                    "size_bytes": 935057162,
                    "date_uploaded": "2024-12-28 01:34:28",
                    "date_uploaded_unix": 1735346068
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/171E87369EB8CA10B4E3F3DB19EA3449ED9D21B1",
                    "hash": "171E87369EB8CA10B4E3F3DB19EA3449ED9D21B1",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "5.1",
                    "seeds": 0,
                    "peers": 0,
                    "size": "1.79 GB",
                    "size_bytes": 1921997865,
                    "date_uploaded": "2024-12-28 02:37:41",
                    "date_uploaded_unix": 1735349861
                  }
                ],
                "date_uploaded": "2024-12-28 01:34:28",
                "date_uploaded_unix": 1735346068
              },
              {
                "id": 65726,
                "url":
                    "https://yts.mx/movies/josh-groban-friends-home-for-the-holidays-2024",
                "imdb_code": "tt34722583",
                "title": "Josh Groban & Friends: Home for the Holidays",
                "title_english": "Josh Groban & Friends: Home for the Holidays",
                "title_long":
                    "Josh Groban & Friends: Home for the Holidays (2024)",
                "slug": "josh-groban-friends-home-for-the-holidays-2024",
                "year": 2024,
                "rating": 7.2,
                "runtime": 0,
                "genres": ["Musical"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "PYlUFFlE3I8",
                "language": "en",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/josh_groban_friends_home_for_the_holidays_2024/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/josh_groban_friends_home_for_the_holidays_2024/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/josh_groban_friends_home_for_the_holidays_2024/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/josh_groban_friends_home_for_the_holidays_2024/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/josh_groban_friends_home_for_the_holidays_2024/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/D205CB191996A9C8B777609F803304277C021868",
                    "hash": "D205CB191996A9C8B777609F803304277C021868",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "411.42 MB",
                    "size_bytes": 431405138,
                    "date_uploaded": "2024-12-27 18:47:50",
                    "date_uploaded_unix": 1735321670
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/91EA271025031F644EEE64051F3E583E66754F52",
                    "hash": "91EA271025031F644EEE64051F3E583E66754F52",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "763.42 MB",
                    "size_bytes": 800503890,
                    "date_uploaded": "2024-12-27 19:19:10",
                    "date_uploaded_unix": 1735323550
                  }
                ],
                "date_uploaded": "2024-12-27 18:47:50",
                "date_uploaded_unix": 1735321670
              },
              {
                "id": 65725,
                "url": "https://yts.mx/movies/burton-and-taylor-2013",
                "imdb_code": "tt2709784",
                "title": "Burton and Taylor",
                "title_english": "Burton and Taylor",
                "title_long": "Burton and Taylor (2013)",
                "slug": "burton-and-taylor-2013",
                "year": 2013,
                "rating": 6.4,
                "runtime": 83,
                "genres": ["Biography", "Drama"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "hYU2mhxEDQI",
                "language": "en",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/burton_and_taylor_2013/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/burton_and_taylor_2013/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/burton_and_taylor_2013/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/burton_and_taylor_2013/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/burton_and_taylor_2013/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/72731606A2807BAECBB0D757A222F61C9EDCFA1D",
                    "hash": "72731606A2807BAECBB0D757A222F61C9EDCFA1D",
                    "quality": "720p",
                    "type": "bluray",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "791.75 MB",
                    "size_bytes": 830210048,
                    "date_uploaded": "2024-12-27 23:14:00",
                    "date_uploaded_unix": 1735337640
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/CC8F9477336DEEAEBCE8ACCE4A8AE0B2EFB833F2",
                    "hash": "CC8F9477336DEEAEBCE8ACCE4A8AE0B2EFB833F2",
                    "quality": "1080p",
                    "type": "bluray",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "1.43 GB",
                    "size_bytes": 1535450808,
                    "date_uploaded": "2024-12-28 00:08:35",
                    "date_uploaded_unix": 1735340915
                  }
                ],
                "date_uploaded": "2024-12-27 23:14:00",
                "date_uploaded_unix": 1735337640
              },
              {
                "id": 65723,
                "url":
                    "https://yts.mx/movies/die-abenteuer-des-werner-holt-1965",
                "imdb_code": "tt0057816",
                "title": "Die Abenteuer des Werner Holt",
                "title_english": "Die Abenteuer des Werner Holt",
                "title_long": "Die Abenteuer des Werner Holt (1965)",
                "slug": "die-abenteuer-des-werner-holt-1965",
                "year": 1965,
                "rating": 7.5,
                "runtime": 164,
                "genres": ["Drama", "Romance", "War"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "",
                "language": "de",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/die_abenteuer_des_werner_holt_1965/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/die_abenteuer_des_werner_holt_1965/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/die_abenteuer_des_werner_holt_1965/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/die_abenteuer_des_werner_holt_1965/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/die_abenteuer_des_werner_holt_1965/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/CF8BBAA5A5945AF708153D2E78E8E5DE68CC2906",
                    "hash": "CF8BBAA5A5945AF708153D2E78E8E5DE68CC2906",
                    "quality": "720p",
                    "type": "bluray",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "1.47 GB",
                    "size_bytes": 1578400481,
                    "date_uploaded": "2024-12-27 23:22:20",
                    "date_uploaded_unix": 1735338140
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/021DEC8CE5091BFCC7FF1D421718762E0ABDC1B8",
                    "hash": "021DEC8CE5091BFCC7FF1D421718762E0ABDC1B8",
                    "quality": "1080p",
                    "type": "bluray",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 46,
                    "peers": 26,
                    "size": "2.74 GB",
                    "size_bytes": 2942052598,
                    "date_uploaded": "2024-12-28 00:58:52",
                    "date_uploaded_unix": 1735343932
                  }
                ],
                "date_uploaded": "2024-12-27 23:22:20",
                "date_uploaded_unix": 1735338140
              },
              {
                "id": 65722,
                "url": "https://yts.mx/movies/micki-maude-1984",
                "imdb_code": "tt0087718",
                "title": "Micki + Maude",
                "title_english": "Micki + Maude",
                "title_long": "Micki + Maude (1984)",
                "slug": "micki-maude-1984",
                "year": 1984,
                "rating": 6,
                "runtime": 118,
                "genres": ["Comedy", "Romance"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "P4cNM_cuee8",
                "language": "en",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/micki_maude_1984/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/micki_maude_1984/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/micki_maude_1984/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/micki_maude_1984/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/micki_maude_1984/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/4451862051B9B7E259EB9BE9396F960765D12F25",
                    "hash": "4451862051B9B7E259EB9BE9396F960765D12F25",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "1.05 GB",
                    "size_bytes": 1127428915,
                    "date_uploaded": "2024-12-27 21:27:30",
                    "date_uploaded_unix": 1735331250
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/49E0E8FD716C0D0F0D6327886A3554EDF8846EE4",
                    "hash": "49E0E8FD716C0D0F0D6327886A3554EDF8846EE4",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "1.96 GB",
                    "size_bytes": 2104533975,
                    "date_uploaded": "2024-12-27 22:41:02",
                    "date_uploaded_unix": 1735335662
                  }
                ],
                "date_uploaded": "2024-12-27 21:27:30",
                "date_uploaded_unix": 1735331250
              },
              {
                "id": 65721,
                "url": "https://yts.mx/movies/death-at-oslo-central-1990",
                "imdb_code": "tt0099479",
                "title": "Death at Oslo Central",
                "title_english": "Death at Oslo Central",
                "title_long": "Death at Oslo Central (1990)",
                "slug": "death-at-oslo-central-1990",
                "year": 1990,
                "rating": 6.1,
                "runtime": 99,
                "genres": ["Action", "Crime", "Drama", "Romance", "Thriller"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "",
                "language": "no",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/death_at_oslo_central_1990/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/death_at_oslo_central_1990/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/death_at_oslo_central_1990/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/death_at_oslo_central_1990/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/death_at_oslo_central_1990/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/C169D78376473EF716A812B34317B7A49497535D",
                    "hash": "C169D78376473EF716A812B34317B7A49497535D",
                    "quality": "720p",
                    "type": "bluray",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "913.08 MB",
                    "size_bytes": 957433774,
                    "date_uploaded": "2024-12-27 23:27:36",
                    "date_uploaded_unix": 1735338456
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/E2A646F12D22B4A1D308DD6ABFAEB698EB3F3B29",
                    "hash": "E2A646F12D22B4A1D308DD6ABFAEB698EB3F3B29",
                    "quality": "1080p",
                    "type": "bluray",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "1.65 GB",
                    "size_bytes": 1771674010,
                    "date_uploaded": "2024-12-28 00:49:08",
                    "date_uploaded_unix": 1735343348
                  }
                ],
                "date_uploaded": "2024-12-27 23:27:36",
                "date_uploaded_unix": 1735338456
              },
              {
                "id": 65717,
                "url": "https://yts.mx/movies/blindness-2016",
                "imdb_code": "tt5662990",
                "title": "Blindness",
                "title_english": "Blindness",
                "title_long": "Blindness (2016)",
                "slug": "blindness-2016",
                "year": 2016,
                "rating": 5.8,
                "runtime": 115,
                "genres": ["Drama"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "1JEry9QPXbE",
                "language": "pl",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/blindness_2016/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/blindness_2016/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/blindness_2016/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/blindness_2016/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/blindness_2016/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/26CB013C7125B30697748227E5601AC7F79F3A57",
                    "hash": "26CB013C7125B30697748227E5601AC7F79F3A57",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 30,
                    "peers": 14,
                    "size": "1008.27 MB",
                    "size_bytes": 1057247724,
                    "date_uploaded": "2024-12-27 21:17:28",
                    "date_uploaded_unix": 1735330648
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/CACB00EF3C11FD7F629C365CF46222FAB29B8639",
                    "hash": "CACB00EF3C11FD7F629C365CF46222FAB29B8639",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "5.1",
                    "seeds": 0,
                    "peers": 0,
                    "size": "2.02 GB",
                    "size_bytes": 2168958484,
                    "date_uploaded": "2024-12-27 22:28:15",
                    "date_uploaded_unix": 1735334895
                  }
                ],
                "date_uploaded": "2024-12-27 21:17:28",
                "date_uploaded_unix": 1735330648
              },
              {
                "id": 65716,
                "url":
                    "https://yts.mx/movies/torching-2024-a-roast-of-the-year-2024",
                "imdb_code": "tt34909701",
                "title": "Torching 2024: A Roast of the Year",
                "title_english": "Torching 2024: A Roast of the Year",
                "title_long": "Torching 2024: A Roast of the Year (2024)",
                "slug": "torching-2024-a-roast-of-the-year-2024",
                "year": 2024,
                "rating": 0,
                "runtime": 42,
                "genres": ["Comedy"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "",
                "language": "en",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/torching_2024_a_roast_of_the_year_2024/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/torching_2024_a_roast_of_the_year_2024/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/torching_2024_a_roast_of_the_year_2024/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/torching_2024_a_roast_of_the_year_2024/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/torching_2024_a_roast_of_the_year_2024/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/802F6BF7AF118C2854EB0F6209E1667514D5AF1D",
                    "hash": "802F6BF7AF118C2854EB0F6209E1667514D5AF1D",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 97,
                    "peers": 24,
                    "size": "392.78 MB",
                    "size_bytes": 411859681,
                    "date_uploaded": "2024-12-27 17:57:15",
                    "date_uploaded_unix": 1735318635
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/BE82BA247BE8C275C2DFBDFDAA5BDD0F2B23FF0E",
                    "hash": "BE82BA247BE8C275C2DFBDFDAA5BDD0F2B23FF0E",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "5.1",
                    "seeds": 0,
                    "peers": 0,
                    "size": "804.1 MB",
                    "size_bytes": 843159962,
                    "date_uploaded": "2024-12-27 18:29:45",
                    "date_uploaded_unix": 1735320585
                  }
                ],
                "date_uploaded": "2024-12-27 17:57:15",
                "date_uploaded_unix": 1735318635
              },
              {
                "id": 65715,
                "url":
                    "https://yts.mx/movies/trentatre-a-dream-in-the-heart-naples-rises-again-2024",
                "imdb_code": "tt34753964",
                "title": "Trentatré - a Dream in the heart: Naples rises again",
                "title_english":
                    "Trentatré - a Dream in the heart: Naples rises again",
                "title_long":
                    "Trentatré - a Dream in the heart: Naples rises again (2024)",
                "slug":
                    "trentatre-a-dream-in-the-heart-naples-rises-again-2024",
                "year": 2024,
                "rating": 9,
                "runtime": 75,
                "genres": ["Documentary"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "",
                "language": "",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/trentatre_a_dream_in_the_heart_naples_rises_again_2024/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/trentatre_a_dream_in_the_heart_naples_rises_again_2024/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/trentatre_a_dream_in_the_heart_naples_rises_again_2024/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/trentatre_a_dream_in_the_heart_naples_rises_again_2024/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/trentatre_a_dream_in_the_heart_naples_rises_again_2024/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/B4B8C43208033083E23561137242EF686CC223D0",
                    "hash": "B4B8C43208033083E23561137242EF686CC223D0",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "691.69 MB",
                    "size_bytes": 725289533,
                    "date_uploaded": "2024-12-27 22:10:46",
                    "date_uploaded_unix": 1735333846
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/10A4310D48C2F33372AC90C1176AC99FC3047610",
                    "hash": "10A4310D48C2F33372AC90C1176AC99FC3047610",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 31,
                    "peers": 15,
                    "size": "1.25 GB",
                    "size_bytes": 1342177280,
                    "date_uploaded": "2024-12-27 23:58:34",
                    "date_uploaded_unix": 1735340314
                  }
                ],
                "date_uploaded": "2024-12-27 22:10:46",
                "date_uploaded_unix": 1735333846
              },
              {
                "id": 65714,
                "url": "https://yts.mx/movies/a-fireman-for-christmas-2023",
                "imdb_code": "tt27757682",
                "title": "A Fireman for Christmas",
                "title_english": "A Fireman for Christmas",
                "title_long": "A Fireman for Christmas (2023)",
                "slug": "a-fireman-for-christmas-2023",
                "year": 2023,
                "rating": 3.5,
                "runtime": 0,
                "genres": ["Comedy", "Drama", "Romance"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "OdQ-IcQFmV0",
                "language": "en",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/a_fireman_for_christmas_2023/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/a_fireman_for_christmas_2023/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/a_fireman_for_christmas_2023/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/a_fireman_for_christmas_2023/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/a_fireman_for_christmas_2023/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/589488D8E163A3FAC1CB11C7CDC00468677068A4",
                    "hash": "589488D8E163A3FAC1CB11C7CDC00468677068A4",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "747.71 MB",
                    "size_bytes": 784030761,
                    "date_uploaded": "2024-12-27 18:07:11",
                    "date_uploaded_unix": 1735319231
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/258991AD825F6334FFCB3330A4F131837B88C0B5",
                    "hash": "258991AD825F6334FFCB3330A4F131837B88C0B5",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "5.1",
                    "seeds": 91,
                    "peers": 27,
                    "size": "1.5 GB",
                    "size_bytes": 1610612736,
                    "date_uploaded": "2024-12-27 18:57:10",
                    "date_uploaded_unix": 1735322230
                  }
                ],
                "date_uploaded": "2024-12-27 18:07:11",
                "date_uploaded_unix": 1735319231
              },
              {
                "id": 65712,
                "url": "https://yts.mx/movies/christmas-in-maple-hills-2023",
                "imdb_code": "tt21375082",
                "title": "Christmas in Maple Hills",
                "title_english": "Christmas in Maple Hills",
                "title_long": "Christmas in Maple Hills (2023)",
                "slug": "christmas-in-maple-hills-2023",
                "year": 2023,
                "rating": 6.9,
                "runtime": 0,
                "genres": ["Romance"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "6lo3H1i4MZ0",
                "language": "en",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/christmas_in_maple_hills_2023/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/christmas_in_maple_hills_2023/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/christmas_in_maple_hills_2023/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/christmas_in_maple_hills_2023/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/christmas_in_maple_hills_2023/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/08ED68BD2E110D5A68C96ABD87465001E5A91CDE",
                    "hash": "08ED68BD2E110D5A68C96ABD87465001E5A91CDE",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 62,
                    "peers": 28,
                    "size": "767.01 MB",
                    "size_bytes": 804268278,
                    "date_uploaded": "2024-12-27 20:36:34",
                    "date_uploaded_unix": 1735328194
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/3FAE2A9638FB5C4215DA8A29DF4508979FC156D4",
                    "hash": "3FAE2A9638FB5C4215DA8A29DF4508979FC156D4",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "5.1",
                    "seeds": 0,
                    "peers": 0,
                    "size": "1.54 GB",
                    "size_bytes": 1653562409,
                    "date_uploaded": "2024-12-27 21:35:32",
                    "date_uploaded_unix": 1735331732
                  }
                ],
                "date_uploaded": "2024-12-27 20:36:34",
                "date_uploaded_unix": 1735328194
              },
              {
                "id": 65713,
                "url": "https://yts.mx/movies/stranger-by-the-shore-2022",
                "imdb_code": "tt31114528",
                "title": "Stranger by the Shore",
                "title_english": "Stranger by the Shore",
                "title_long": "Stranger by the Shore (2022)",
                "slug": "stranger-by-the-shore-2022",
                "year": 2022,
                "rating": 0,
                "runtime": 0,
                "genres": ["Fantasy"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "",
                "language": "zh",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/stranger_by_the_shore_2022/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/stranger_by_the_shore_2022/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/stranger_by_the_shore_2022/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/stranger_by_the_shore_2022/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/stranger_by_the_shore_2022/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/E28C42B1C2632858EE6A790F93AA63E5287403FF",
                    "hash": "E28C42B1C2632858EE6A790F93AA63E5287403FF",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "540.36 MB",
                    "size_bytes": 566608527,
                    "date_uploaded": "2024-12-27 21:11:18",
                    "date_uploaded_unix": 1735330278
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/3C2DBD8047D7F0DD76906543CC12D7BD0425108D",
                    "hash": "3C2DBD8047D7F0DD76906543CC12D7BD0425108D",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "1001.22 MB",
                    "size_bytes": 1049855263,
                    "date_uploaded": "2024-12-27 21:45:37",
                    "date_uploaded_unix": 1735332337
                  }
                ],
                "date_uploaded": "2024-12-27 21:11:18",
                "date_uploaded_unix": 1735330278
              },
              {
                "id": 65711,
                "url": "https://yts.mx/movies/flammenmadchen-2021",
                "imdb_code": "tt14268332",
                "title": "Flammenmädchen",
                "title_english": "Flammenmädchen",
                "title_long": "Flammenmädchen (2021)",
                "slug": "flammenmadchen-2021",
                "year": 2021,
                "rating": 6.8,
                "runtime": 90,
                "genres": ["Crime"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "",
                "language": "de",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/flammenmadchen_2021/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/flammenmadchen_2021/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/flammenmadchen_2021/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/flammenmadchen_2021/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/flammenmadchen_2021/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/CCA436E1E3ABA7C2B68C1512AFF3F30D1DC08214",
                    "hash": "CCA436E1E3ABA7C2B68C1512AFF3F30D1DC08214",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "828.26 MB",
                    "size_bytes": 868493558,
                    "date_uploaded": "2024-12-27 18:56:12",
                    "date_uploaded_unix": 1735322172
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/097D40595EF04CF45692BC9A9122B4BA6B64E3D4",
                    "hash": "097D40595EF04CF45692BC9A9122B4BA6B64E3D4",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 50,
                    "peers": 17,
                    "size": "1.5 GB",
                    "size_bytes": 1610612736,
                    "date_uploaded": "2024-12-27 21:14:26",
                    "date_uploaded_unix": 1735330466
                  }
                ],
                "date_uploaded": "2024-12-27 18:56:12",
                "date_uploaded_unix": 1735322172
              },
              {
                "id": 65709,
                "url": "https://yts.mx/movies/one-of-a-kind-2023",
                "imdb_code": "tt9885000",
                "title": "One of a Kind",
                "title_english": "One of a Kind",
                "title_long": "One of a Kind (2023)",
                "slug": "one-of-a-kind-2023",
                "year": 2023,
                "rating": 8,
                "runtime": 99,
                "genres": ["Drama"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "5wOwj5cNhAc",
                "language": "ur",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/one_of_a_kind_2023/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/one_of_a_kind_2023/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/one_of_a_kind_2023/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/one_of_a_kind_2023/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/one_of_a_kind_2023/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/B2D8AACEFDE84028E3BD4562F0C8B51AC999D351",
                    "hash": "B2D8AACEFDE84028E3BD4562F0C8B51AC999D351",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "429.99 MB",
                    "size_bytes": 450877194,
                    "date_uploaded": "2024-12-27 17:53:10",
                    "date_uploaded_unix": 1735318390
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/1D89C868B9E6140252440021FDCA0475DA4CB56E",
                    "hash": "1D89C868B9E6140252440021FDCA0475DA4CB56E",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 32,
                    "peers": 14,
                    "size": "797.06 MB",
                    "size_bytes": 835777987,
                    "date_uploaded": "2024-12-27 18:24:37",
                    "date_uploaded_unix": 1735320277
                  }
                ],
                "date_uploaded": "2024-12-27 17:53:10",
                "date_uploaded_unix": 1735318390
              },
              {
                "id": 65708,
                "url": "https://yts.mx/movies/filme-gel-2024",
                "imdb_code": "tt24516554",
                "title": "Filme Gel",
                "title_english": "Filme Gel",
                "title_long": "Filme Gel (2024)",
                "slug": "filme-gel-2024",
                "year": 2024,
                "rating": 4.3,
                "runtime": 0,
                "genres": ["Comedy"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "",
                "language": "tr",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/filme_gel_2024/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/filme_gel_2024/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/filme_gel_2024/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/filme_gel_2024/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/filme_gel_2024/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/764AE02A5561C14E8A101E9E072A5079A1AD107B",
                    "hash": "764AE02A5561C14E8A101E9E072A5079A1AD107B",
                    "quality": "720p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "795.07 MB",
                    "size_bytes": 833691320,
                    "date_uploaded": "2024-12-27 19:43:41",
                    "date_uploaded_unix": 1735325021
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/0DAC0969F8153BF0BE0BE45D476BF74449B3A396",
                    "hash": "0DAC0969F8153BF0BE0BE45D476BF74449B3A396",
                    "quality": "1080p",
                    "type": "web",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 32,
                    "peers": 12,
                    "size": "1.44 GB",
                    "size_bytes": 1546188227,
                    "date_uploaded": "2024-12-27 20:52:28",
                    "date_uploaded_unix": 1735329148
                  }
                ],
                "date_uploaded": "2024-12-27 19:43:41",
                "date_uploaded_unix": 1735325021
              },
              {
                "id": 65707,
                "url": "https://yts.mx/movies/between-the-beats-2024",
                "imdb_code": "tt33499295",
                "title": "Between the Beats",
                "title_english": "Between the Beats",
                "title_long": "Between the Beats (2024)",
                "slug": "between-the-beats-2024",
                "year": 2024,
                "rating": 7.6,
                "runtime": 89,
                "genres": ["Documentary"],
                "summary": "",
                "description_full": "",
                "synopsis": "",
                "yt_trailer_code": "pmoVTRXLXc8",
                "language": "en",
                "mpa_rating": "",
                "background_image":
                    "https://yts.mx/assets/images/movies/between_the_beats_2024/background.jpg",
                "background_image_original":
                    "https://yts.mx/assets/images/movies/between_the_beats_2024/background.jpg",
                "small_cover_image":
                    "https://yts.mx/assets/images/movies/between_the_beats_2024/small-cover.jpg",
                "medium_cover_image":
                    "https://yts.mx/assets/images/movies/between_the_beats_2024/medium-cover.jpg",
                "large_cover_image":
                    "https://yts.mx/assets/images/movies/between_the_beats_2024/large-cover.jpg",
                "state": "ok",
                "torrents": [
                  {
                    "url":
                        "https://yts.mx/torrent/download/E1E5563936ACA9DD326B2B26D0EC5F85D22AC903",
                    "hash": "E1E5563936ACA9DD326B2B26D0EC5F85D22AC903",
                    "quality": "720p",
                    "type": "bluray",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "811.79 MB",
                    "size_bytes": 851223511,
                    "date_uploaded": "2024-12-27 19:00:29",
                    "date_uploaded_unix": 1735322429
                  },
                  {
                    "url":
                        "https://yts.mx/torrent/download/CC8A820593D2EADC91B31EE891F01007659D18FC",
                    "hash": "CC8A820593D2EADC91B31EE891F01007659D18FC",
                    "quality": "1080p",
                    "type": "bluray",
                    "is_repack": "0",
                    "video_codec": "x264",
                    "bit_depth": "8",
                    "audio_channels": "2.0",
                    "seeds": 0,
                    "peers": 0,
                    "size": "1.47 GB",
                    "size_bytes": 1578400481,
                    "date_uploaded": "2024-12-27 20:03:44",
                    "date_uploaded_unix": 1735326224
                  }
                ],
                "date_uploaded": "2024-12-27 19:00:29",
                "date_uploaded_unix": 1735322429
              }
            ]
          },
          "@meta": {
            "server_time": 1735371662,
            "server_timezone": "CET",
            "api_version": 2,
            "execution_time": "0 ms"
          }
        };

        final response = await dio.get(
          getPath(path, queryParameters),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        } else {
          return ServerErrorModel.fromJson(response.data);
        }
      } else {
        return const ServerErrorModel(
          message: '',
        );
      }
    } catch (exception) {
      return ServerErrorModel(
        message: hideError ? '' : AppExceptions.handleException(exception),
      );
    }
  }

  dynamic post(
    String path, {
    dynamic params,
    dio.FormData? formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    _options.headers = await getHeader();
    final dio = Dio(_options);
    try {
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        final response = await dio.post(
          path,
          data: formData ?? jsonEncode(params ?? {}),
          queryParameters: queryParameters,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        } else {
          return ServerErrorModel.fromJson(response.data);
        }
      } else {
        return const ServerErrorModel(
          message: '',
        );
      }
    } catch (exception) {
      return ServerErrorModel(
        message: AppExceptions.handleException(exception),
      );
    }
  }

  dynamic put(
    String path, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? queryParameters,
  }) async {
    _options.headers = await getHeader();
    final dio = Dio(_options);
    try {
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        final response = await dio.put(
          getPath(path, queryParameters),
          data: jsonEncode(params ?? {}),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        } else {
          return ServerErrorModel.fromJson(response.data);
        }
      } else {
        return const ServerErrorModel(
          message: '',
        );
      }
    } catch (exception) {
      return ServerErrorModel(
        message: AppExceptions.handleException(exception),
      );
    }
  }

  dynamic patch(
    String path, {
    dynamic params,
    dio.FormData? formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    _options.headers = await getHeader();
    final dio = Dio(_options);
    try {
      bool isConnected = await checkInternetConnection();
      if (isConnected) {
        final response = await dio.patch(
          path,
          data: formData ?? jsonEncode(params ?? {}),
          queryParameters: queryParameters,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        } else {
          return ServerErrorModel.fromJson(response.data);
        }
      } else {
        return const ServerErrorModel(
          message: '',
        );
      }
    } catch (exception) {
      return ServerErrorModel(
        message: AppExceptions.handleException(exception),
      );
    }
  }

  Future<Map<String, dynamic>> getHeader() async {
    Map<String, String> header = <String, String>{};
    // String authToken = await getAuthToken();
    // if (authToken.isNotEmpty) {
    //   header.putIfAbsent(ApiConstants.authorization, () => authToken);
    // }

    header.putIfAbsent(
      ApiConstants.host,
      () => ApiConstants.hostValue,
    );

    header.putIfAbsent(
      ApiConstants.key,
      () => ApiConstants.apiKey,
    );
    return header;
  }

  String getPath(String path, Map<dynamic, dynamic>? params) {
    String paramsString = '';
    if (params?.isNotEmpty ?? false) {
      int count = 0;
      params?.forEach((key, value) {
        if (count == 0) {
          paramsString = '$key=$value';
        } else {
          paramsString += '&$key=$value';
        }
        count++;
      });
    }
    return '${ApiConstants.baseURL}$path?$paramsString';
  }

  Future<String> getAuthToken() async {
    String authToken = getItInstance<LocalUseCase>().getAccessToken() ?? '';
    return authToken;
  }

  static Future<bool> checkInternetConnection() async {
    bool isConnected = false;
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        isConnected = true;
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        isConnected = true;
      } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
        isConnected = true;
      } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
        isConnected = true;
      } else if (connectivityResult.contains(ConnectivityResult.other)) {
        isConnected = true;
      } else {
        isConnected = false;
      }
    } catch (exception) {
      isConnected = false;
    }
    return isConnected;
  }
}
