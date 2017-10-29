# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# To run this on Gigalixir, first make sure you're migrated...
#
#     $ gigalixir migrate $APP_NAME
#
# ...then SSH in...
#
#     $ gigalixir remote_console $APP_NAME
#
# ...then get at the seeds file from the console...
#
#     $> Path.join([:code.priv_dir(:gigalixir_getting_started), "repo", "seeds.exs"]) |> Code.eval_file

alias GigalixirGettingStarted.{
  Repo,
  Show,
  Set,
  Song,
  SongPerformance,
}

songs = %{
  _9to5: Repo.insert!(%Song{name: "9 to 5", author: "Dolly Parton"}),
  _9x9: Repo.insert!(%Song{name: "9 x 9", author: "Benevento/Russo Duo"}),

  hardrains: Repo.insert!(%Song{name: "A Hard Rain's A-Gonna Fall", author: "Bob Dylan"}),
  aiko: Repo.insert!(%Song{name: "Aiko Aiko", author: "(trad)"}),
  alabamagetaway: Repo.insert!(%Song{name: "Alabama Getaway"}),
  millionaire: Repo.insert!(%Song{name: "Alice D. Millionaire"}),
  watchtower: Repo.insert!(%Song{name: "All Along The Watchtower", author: "Bob Dylan"}),
  alligator: Repo.insert!(%Song{name: "Alligator"}),
  allnewminglewood: Repo.insert!(%Song{name: "All New Minglewood Blues"}),
  althea: Repo.insert!(%Song{name: "Althea"}),
  atasiding: Repo.insert!(%Song{name: "At A Siding"}), # part of Terrapin Suite
  atlanticcity: Repo.insert!(%Song{name: "Atlantic City", author: "Bruce Springsteen"}),
  auld: Repo.insert!(%Song{name: "Auld Lang Syne", author: "(trad)"}),

  biodtl: Repo.insert!(%Song{name: "Beat It On Down The Line"}),
  becky: Repo.insert!(%Song{name: "Becky", author: "Benevento/Russo Duo"}),
  caughtstealin: Repo.insert!(%Song{name: "Been Caught Stealing", author: "Jane's Addiction"}),
  bertha: Repo.insert!(%Song{name: "Bertha"}),
  bigrailroad: Repo.insert!(%Song{name: "Big Railroad Blues"}),
  bigriver: Repo.insert!(%Song{name: "Big River"}),
  bigwhopper: Repo.insert!(%Song{name: "Big Whopper", author: "Benevento/Russo Duo"}),
  birdsong: Repo.insert!(%Song{name: "Bird Song"}),
  blackpeter: Repo.insert!(%Song{name: "Black Peter"}),
  btw: Repo.insert!(%Song{name: "Black Throated Wind"}),
  blues4allah: Repo.insert!(%Song{name: "Blues For Allah (instrumental)"}),
  bornXeyed: Repo.insert!(%Song{name: "Born Cross Eyed"}),
  born2run: Repo.insert!(%Song{name: "Born To Run", author: "Bruce Springsteen"}),
  boxofrain: Repo.insert!(%Song{name: "Box Of Rain"}),
  brokedown: Repo.insert!(%Song{name: "Brokedown Palace"}),
  browneyedwomen: Repo.insert!(%Song{name: "Brown-Eyed Women"}),
  bubblehouse: Repo.insert!(%Song{name: "Bubblehouse", author: "Medeski Martin and Wood"}),
  built2last: Repo.insert!(%Song{name: "Built To Last"}),

  candyman: Repo.insert!(%Song{name: "Candyman"}),
  cantturn: Repo.insert!(%Song{name: "Can't Turn You Loose"}),
  caseyjones: Repo.insert!(%Song{name: "Casey Jones"}),
  cassidy: Repo.insert!(%Song{name: "Cassidy"}),
  caution: Repo.insert!(%Song{name: "Caution (Do Not Stop On Tracks)"}),
  chinacat: Repo.insert!(%Song{name: "China Cat Sunflower"}),
  chuckles: Repo.insert!(%Song{name: "Chuckles", author: "WOLF!"}),
  cinnamon: Repo.insert!(%Song{name: "Cinnamon & Lesbians", author: "Stephen Malkmus"}),
  coldrain: Repo.insert!(%Song{name: "Cold Rain and Snow"}),
  cosmiccharlie: Repo.insert!(%Song{name: "Cosmic Charlie"}),
  crazyfingers: Repo.insert!(%Song{name: "Crazy Fingers"}),
  creampuff: Repo.insert!(%Song{name: "Cream Puff War"}),
  cryptical: Repo.insert!(%Song{name: "Cryptical Envelopment"}),
  cumberland: Repo.insert!(%Song{name: "Cumberland Blues"}),

  sugarplumfairy: Repo.insert!(%Song{name: "Dance Of The Sugar Plum Fairy", author: "Tchaikovsky"}),
  dancin: Repo.insert!(%Song{name: "Dancing In The Streets"}),
  darkhollow: Repo.insert!(%Song{name: "Dark Hollow"}),
  darkstar: Repo.insert!(%Song{name: "Dark Star"}),
  daytripper: Repo.insert!(%Song{name: "Day Tripper"}),
  deal: Repo.insert!(%Song{name: "Deal"}),
  deepelem: Repo.insert!(%Song{name: "Deep Elem Blues"}),
  direwolf: Repo.insert!(%Song{name: "Dire Wolf"}),
  thatrag: Repo.insert!(%Song{name: "Doin' That Rag"}),
  dontdoit: Repo.insert!(%Song{name: "Don't Do It", author: "Holland-Dozier-Holland"}),
  dontease: Repo.insert!(%Song{name: "Don't Ease Me In"}),
  drums: Repo.insert!(%Song{name: "Drums"}),
  duprees: Repo.insert!(%Song{name: "Dupree's Diamond Blues"}),

  easywind: Repo.insert!(%Song{name: "Easy Wind"}),
  estimated: Repo.insert!(%Song{name: "Estimated Prophet"}),
  eyes: Repo.insert!(%Song{name: "Eyes Of The World"}),

  fame: Repo.insert!(%Song{name: "Fame", author: "David Bowie"}),
  stranger: Repo.insert!(%Song{name: "Feel Like A Stranger"}),
  _50ways: Repo.insert!(%Song{name: "Fifty Ways to Leave Your Lover", author: "Paul Simon"}),
  firemtn: Repo.insert!(%Song{name: "Fire On The Mountain"}),
  fortuneteller: Repo.insert!(%Song{name: "Fortune Teller", author: "Allen Toussanit"}),
  franklins: Repo.insert!(%Song{name: "Franklin's Tower"}),
  frienddevil: Repo.insert!(%Song{name: "Friend Of The Devil"}),
  friends: Repo.insert!(%Song{name: "Friends", author: "Led Zepplin"}),

  girlfriend: Repo.insert!(%Song{name: "Girlfriend Is Better", author: "Talking Heads"}),
  godsmile: Repo.insert!(%Song{name: "God Put A Smile Upon Your Face", author: "Cold Play"}),
  gdtrfb: Repo.insert!(%Song{name: "Going Down The Road Feeling Bad"}),
  goldenroad: Repo.insert!(%Song{name: "Golden Road (To Unlimited Devotion)"}),
  gonesville: Repo.insert!(%Song{name: "Gonesville", author: "Bob Weir"}),
  goodlovin: Repo.insert!(%Song{name: "Good Lovin'"}),
  goodmorning: Repo.insert!(%Song{name: "Good Morning Little School Girl", author: "Sonny Boy Williamson"}),
  greateststory: Repo.insert!(%Song{name: "Greatest Story Ever Told"}),

  halloweentheme: Repo.insert!(%Song{name: "\"Halloween\" Theme Main Title", author: "John Carpenter"}),
  happybirthday: Repo.insert!(%Song{name: "Happy Birthday", author: "(trad)"}),
  hard2handle: Repo.insert!(%Song{name: "Hard To Handle", author: "Otis Redding"}),
  harry: Repo.insert!(%Song{name: "Harry Hood", author: "Phish"}),
  hesgone: Repo.insert!(%Song{name: "He's Gone"}),
  friendofmine: Repo.insert!(%Song{name: "He Was a Friend of Mine", author: "Bob Dylan"}),
  heartbreaker: Repo.insert!(%Song{name: "Heartbreaker"}),
  hellbucket: Repo.insert!(%Song{name: "Hell In A Bucket"}),
  help: Repo.insert!(%Song{name: "Help On The Way"}),
  sunshine: Repo.insert!(%Song{name: "Here Comes Sunshine"}),
  heybo: Repo.insert!(%Song{name: "Hey Bo Diddley", author: "Bo Diddley"}),
  heybulldog: Repo.insert!(%Song{name: "Hey Bulldog", author: "The Beatles"}),
  hippydream: Repo.insert!(%Song{name: "Hippy Dream", author: "Neil Young"}),
  hoodoo: Repo.insert!(%Song{name: "Hoo Doo Voo Doo", author: "Wilco/B Bragg/W. Guthrie"}),

  walrus: Repo.insert!(%Song{name: "I Am The Walrus", author: "The Beatles"}),
  rider: Repo.insert!(%Song{name: "I Know You Rider"}),
  writinganovel: Repo.insert!(%Song{name: "I'm Writing A Novel", author: "Father John Misty"}),
  needamiracle: Repo.insert!(%Song{name: "I Need A Miracle"}),
  elizabethreed: Repo.insert!(%Song{name: "In Memory of Elizabeth Reed", author: "Allman Brothers Band"}),
  incrowd: Repo.insert!(%Song{name: "\"In With The In Crowd\"", author: "Ramsey Lewis"}),
  allovernow: Repo.insert!(%Song{name: "It's All Over Now Baby Blue", author: "Bob Dylan"}),

  jackaroe: Repo.insert!(%Song{name: "Jack A Roe"}),
  jackstraw: Repo.insert!(%Song{name: "Jack Straw"}),
  jam: Repo.insert!(%Song{name: "Jam"}),
  joeline: Repo.insert!(%Song{name: "Joeline", author: "Tom Hamilton"}),

  kashmir: Repo.insert!(%Song{name: "Kashmir", author: "Led Zeppelin"}),
  keepingitsimple: Repo.insert!(%Song{name: "Keeping It Simple", author: "JRAD"}),
  killercars: Repo.insert!(%Song{name: "Killer Cars", author: "Radiohead"}),
  kingbee: Repo.insert!(%Song{name: "King Bee", author: "Slim Harpo"}),
  kingsolomons: Repo.insert!(%Song{name: "King Solomon's Marbles"}),

  ladywithfan: Repo.insert!(%Song{name: "Lady With a Fan"}), # part of Terrapin Suite
  lawoman: Repo.insert!(%Song{name: "LA Woman", author: "The Doors"}),
  lazylightning: Repo.insert!(%Song{name: "Lazy Lightning"}),
  lemonsong: Repo.insert!(%Song{name: "Lemon Song", author: "Led Zeppelin / Robert Johnson"}),
  lifecarnival: Repo.insert!(%Song{name: "Life Is A Carnival", author: "The Band"}),
  littleredrooster: Repo.insert!(%Song{name: "Little Red Rooster", author: "Willie Dixon"}),
  lonesomewhistle: Repo.insert!(%Song{name: "Lonesome Whistle Blues", author: "Bob Dylan"}),
  lookslikerain: Repo.insert!(%Song{name: "Looks Like Rain"}),
  looselucy: Repo.insert!(%Song{name: "Loose Lucy"}),
  loser: Repo.insert!(%Song{name: "Loser"}),
  lostsailor: Repo.insert!(%Song{name: "Lost Sailor"}),

  magnificent: Repo.insert!(%Song{name: "Magnificent Sanctuary Band", author: "Jerry Garcia Band"}),
  mamatried: Repo.insert!(%Song{name: "Mama Tried"}),
  masonschildren: Repo.insert!(%Song{name: "Mason's Children"}),
  memyuncle: Repo.insert!(%Song{name: "Me And My Uncle"}),
  missionrain: Repo.insert!(%Song{name: "Mission In The Rain"}),
  missisissippihalfstep: Repo.insert!(%Song{name: "Mississippi Halfstep Uptown Toodeloo"}),
  mobydick: Repo.insert!(%Song{name: "Moby Dick", author: "Led Zeppelin"}),
  morfbeats: Repo.insert!(%Song{name: "Morfbeats", author: "..."}),
  morningdew: Repo.insert!(%Song{name: "Morning Dew"}),
  mtnsmoon: Repo.insert!(%Song{name: "Mountains Of The Moon"}),
  mrcharlie: Repo.insert!(%Song{name: "Mr. Charlie"}),
  musthavebeen: Repo.insert!(%Song{name: "Must Have Been The Roses"}),
  brotheresau: Repo.insert!(%Song{name: "My Brother Esau"}),
  mysharona: Repo.insert!(%Song{name: "My Sharona", author: "The Knack"}),
  myxomatosis: Repo.insert!(%Song{name: "Myxomatosis", author: "Radiohead"}),

  nationalanthem: Repo.insert!(%Song{name: "National Anthem", author: "Radiohead"}),
  neworleansmarch: Repo.insert!(%Song{name: "New Orleans March"}),
  newspeedway: Repo.insert!(%Song{name: "New Speedway Boogie"}),
  noquarter: Repo.insert!(%Song{name: "No Quarter", author: "Led Zeppelin"}),
  nfa: Repo.insert!(%Song{name: "Not Fade Away"}),

  saturdaynight: Repo.insert!(%Song{name: "One More Saturday Night"}),
  onlydaddy: Repo.insert!(%Song{name: "Only Daddy That'll Walk The Line", author: "Waylon Jennings"}),
  ontheroad: Repo.insert!(%Song{name: "On The Road Again"}),
  ophelia: Repo.insert!(%Song{name: "Ophelia", author: "The Band"}),

  paranoidandroid: Repo.insert!(%Song{name: "Paranoid Android", author: "Radiohead"}),
  passenger: Repo.insert!(%Song{name: "Passenger"}),
  playpausestop: Repo.insert!(%Song{name: "Play, Pause, Stop", author: "Benevento/Russo Duo"}),
  playin: Repo.insert!(%Song{name: "Playin' In The Band"}),
  porkslaw: Repo.insert!(%Song{name: "Pork & Slaw", author: "WOLF!"}),
  pridecucamonga: Repo.insert!(%Song{name: "Pride of Cucamonga"}),
  promisedland: Repo.insert!(%Song{name: "Promised Land", author: "Chuck Berry"}),

  mightyquinn: Repo.insert!(%Song{name: "Quinn The Eskimo", author: "Bob Dylan"}),

  raceison: Repo.insert!(%Song{name: "Race Is On"}),
  ramebleonrose: Repo.insert!(%Song{name: "Ramble On Rose"}),
  reubencherise: Repo.insert!(%Song{name: "Reuben & Cherise"}),
  revolution9: Repo.insert!(%Song{name: "Revolution No. 9", author: "The Beatles"}),
  ripple: Repo.insert!(%Song{name: "Ripple"}),
  rowjimmy: Repo.insert!(%Song{name: "Row Jimmy"}),
  royals: Repo.insert!(%Song{name: "Royals", author: "Lorde"}),

  stofcircumstance: Repo.insert!(%Song{name: "Saint of Circumstance"}),
  samsondelilah: Repo.insert!(%Song{name: "Samson & Delilah"}),
  scarlet: Repo.insert!(%Song{name: "Scarlet Begonias"}),
  shakedown: Repo.insert!(%Song{name: "Shakedown Street"}),
  shelterfromstorm: Repo.insert!(%Song{name: "Shelter From The Storm", author: "Bob Dylan"}),
  silvio: Repo.insert!(%Song{name: "Silvio", author: "Robert Hunter/Bob Dylan"}),
  sittingontop: Repo.insert!(%Song{name: "Sitting On Top Of The World"}),
  slip: Repo.insert!(%Song{name: "Slipknot!"}),
  solongjerry: Repo.insert!(%Song{name: "So Long Jerry", author: "Ween"}),
  somanyroads: Repo.insert!(%Song{name: "So Many Roads"}),
  sowhat: Repo.insert!(%Song{name: "So What", author: "Miles Davis"}),
  space: Repo.insert!(%Song{name: "Space"}),
  ststephen: Repo.insert!(%Song{name: "St. Stephen"}),
  staggerlee: Repo.insert!(%Song{name: "Stagger Lee"}),
  standingmoon: Repo.insert!(%Song{name: "Standing On The Moon"}),
  stella: Repo.insert!(%Song{name: "Stella Blue"}),
  suchanight: Repo.insert!(%Song{name: "Such A Night", author: "Dr John"}),
  sugarmag: Repo.insert!(%Song{name: "Sugar Magnolia"}),
  sugaree: Repo.insert!(%Song{name: "Sugaree"}),
  summernights: Repo.insert!(%Song{name: "Summer Nights", author: "Jim Jacobs / Warren Casey"}),
  sunshinedaydream: Repo.insert!(%Song{name: "Sunshine Daydream"}),
  superstition: Repo.insert!(%Song{name: "Superstition", author: "Stevie Wonder"}),
  supplication: Repo.insert!(%Song{name: "Supplication"}),

  tellmemomma: Repo.insert!(%Song{name: "Tell Me, Momma", author: "Bob Dylan"}),
  tennesseejed: Repo.insert!(%Song{name: "Tennessee Jed"}),
  tequila: Repo.insert!(%Song{name: "Tequila", author: "The Champs"}),
  # terrapin: Repo.insert!(%Song{name: "Terrapin"}), # part of Terrapin Suite
  terrapinflyer: Repo.insert!(%Song{name: "Terrapin Flyer"}), # part of Terrapin Suite
  # terrapinrefrain: Repo.insert!(%Song{name: "Terrapin Refrain"}), # part of Terrapin Suite
  terrapinstation: Repo.insert!(%Song{name: "Terrapin Station"}), # part of Terrapin Suite
  terrapintransit: Repo.insert!(%Song{name: "Terrapin Transit"}), # part of Terrapin Suite
  #thankyousean: Repo.insert!(%Song{name: "Thank You Sean"}), # ...this is spoken isn't it?
  thatstheway: Repo.insert!(%Song{name: "That's The Way", author: "Led Zeppelin"}),
  bends: Repo.insert!(%Song{name: "The Bends", author: "Radiohead"}),
  the11: Repo.insert!(%Song{name: "The Eleven"}),
  musicneverstopped: Repo.insert!(%Song{name: "The Music Never Stopped"}),
  droveolddixie: Repo.insert!(%Song{name: "The Night They Drove Old Dixie Down", author: "The Band"}),
  other1: Repo.insert!(%Song{name: "The Other One"}),
  stranger2souls: Repo.insert!(%Song{name: "The Stranger (Two Souls In Communion)"}),
  weight: Repo.insert!(%Song{name: "The Weight", author: "The Band"}),
  wheel: Repo.insert!(%Song{name: "The Wheel"}),
  thereisamtn: Repo.insert!(%Song{name: "There Is A Mountain", author: "Donovan"}),
  theyloveeachother: Repo.insert!(%Song{name: "They Love Each Other"}),
  _3rdstone: Repo.insert!(%Song{name: "Third Stone From The Sun", author: "Jimi Hendrix"}),
  _3questionmarks: Repo.insert!(%Song{name: "Three Question Marks", author: "Joe Lukasik"}),
  throwingstones: Repo.insert!(%Song{name: "Throwing Stones"}),
  tico: Repo.insert!(%Song{name: "Tico Tico", author: "Zequinha de Abreu"}),
  tilthemorningcomes: Repo.insert!(%Song{name: "Til The Morning Comes"}),
  touchofgrey: Repo.insert!(%Song{name: "Touch Of Grey"}),
  toughmama: Repo.insert!(%Song{name: "Tough Mama", author: "Bob Dylan"}),
  truckin: Repo.insert!(%Song{name: "Truckin'"}),
  lovelight: Repo.insert!(%Song{name: "Turn On Your Lovelight"}),
  tzofeh: Repo.insert!(%Song{name: "Tzofeh", author: "Masada"}),

  usblues: Repo.insert!(%Song{name: "U.S. Blues"}),
  unbrokenchain: Repo.insert!(%Song{name: "Unbroken Chain"}),
  unclejohns: Repo.insert!(%Song{name: "Uncle John's Band"}),

  vampireblues: Repo.insert!(%Song{name: "Vampire Blues", author: "Neil Young"}),
  violalee: Repo.insert!(%Song{name: "Viola Lee Blues"}),

  webidyou: Repo.insert!(%Song{name: "We Bid You Goodnight"}),
  weatherreport: Repo.insert!(%Song{name: "Weather Report Suite"}), # prelude, part 1, part 2/LIG
  werewolves: Repo.insert!(%Song{name: "Werewolves of London", author: "Warren Zevon"}),
  westla: Repo.insert!(%Song{name: "West LA Fadeaway"}),
  wharfrat: Repo.insert!(%Song{name: "Wharf Rat"}),
  whenipaint: Repo.insert!(%Song{name: "When I Paint My Masterpiece", author: "Bob Dylan"}),
  womenaresmarter: Repo.insert!(%Song{name: "Women Are Smarter"}),
}

create_show = fn (date, sets, encores) ->
  # date ~N[]
  # sets: [
  #   [101, 102...],
  #   [201, 202, ...],
  # ]
  # encores: [
  #   [e101, ],
  #   [e201, ],
  # ]
  show = Repo.insert!(%Show{date: date})
  for {setlist, index_set} <- Enum.with_index(sets) do
    set = Repo.insert!(%Set{which: "#{1+index_set}", show: show})
    for {song, index_song} <- Enum.with_index(setlist) do
      Repo.insert!(%SongPerformance{song: song, set: set, position: 1+index_song})
    end
  end
  for {encorelist, index_encore} <- Enum.with_index(encores) do
    encore = Repo.insert!(%Set{which: "e#{1+index_encore}", show: show})
    for {song, index_song} <- Enum.with_index(encorelist) do
      Repo.insert!(%SongPerformance{song: song, set: encore, position: 1+index_song})
    end
  end
end

show1 = create_show.(
  ~N[2013-01-26 12:00:00],
  [
    [songs.bertha, songs.althea, songs.jackstraw, songs.deal, songs.mrcharlie, songs.browneyedwomen, songs.tennesseejed, songs.shakedown, songs.chinacat, songs.rider],
    [songs.estimated, songs.eyes, songs.help, songs.slip, songs.franklins, songs.ststephen, songs.the11, songs.caution, songs.other1, songs.violalee]
  ],
  [ [songs.usblues] ]
)

show2 = create_show.(
  ~N[2013-12-27 12:00:00],
  [
    [songs.creampuff, songs.truckin, songs.duprees, songs.cumberland, songs.rowjimmy, songs.bertha, songs.easywind, songs.shakedown],
    [songs.scarlet, songs.firemtn, songs.playin, songs.althea, songs.lovelight, songs.terrapinstation]
  ],
  [ [songs.brokedown] ]
)

show = create_show.(
  ~N[2014-08-01 12:00:00],
  [
    [songs.unclejohns, songs.lazylightning, songs.ststephen, songs.the11, songs.caseyjones, songs.deal, songs.magnificent, songs.reubencherise, songs.eyes, songs.lazylightning, songs.unclejohns], # 2nd lazylightning & unclejohns are reprise
  ],
  []
)

show = create_show.(
  ~N[2014-09-19 12:00:00],
  [
    [songs.biodtl, songs.frienddevil, songs.cumberland, songs.violalee, songs.unclejohns, songs.truckin, songs.other1],
    [songs.atasiding, songs.shakedown, songs.chinacat, songs.the11, songs.rider, songs.wheel, songs.ladywithfan, songs.terrapinstation]
  ],
  [ [songs.lonesomewhistle] ]
)

# show = create_show.(
#   ~N[2014-09-20 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2014-10-05 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2014-10-10 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2014-10-11 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2014-11-02 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2014-12-29 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2014-12-30 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2014-12-31 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-01-23 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-01-24 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-02-05 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-02-06 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-02-07 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-02-08 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-02-14 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-02-15 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-02-16 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-04-22 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-04-23 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-04-24 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-04-25 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-05-01 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-05-02 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-05-09 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-05-16 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-05-22 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-05-23 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-05-24 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-05-30 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-06-03 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-06-05 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-06-06 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-06-25 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-07-05 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-07-10 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-08-08 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-08-14 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-08-22 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-09-04 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-09-06 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-09-19 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-10-02 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-10-03 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-10-04 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-10-28 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-10-29 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-10-30 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-10-31 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-11-27 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-11-28 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-12-11 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-12-12 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-12-19 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2015-12-31 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-01-01 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-01-02 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-01-06 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-01-07 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-02-10 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-02-11 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-02-12 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-02-13 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-02-14 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-03-24 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-03-25 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-03-26 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-04-29 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-04-30 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-06-30 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-07-01 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-07-02 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-07-03 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-08-11 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-08-20 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-08-25 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-08-26 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-10-06 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-10-07 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-10-08 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-11-11 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-11-12 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-11-26 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-12-02 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-12-04 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-12-15 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-12-16 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-12-17 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-12-28 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-12-29 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-12-30 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2016-12-31 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-01-12 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-01-13 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-01-14 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-01-15 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-03-09 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-03-10 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-03-11 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-03-16 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-03-17 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-03-18 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-03-31 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-04-28 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-04-29 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-05-05 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-05-06 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-05-07 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-06-03 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-07-16 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-07-21 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-07-22 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-08-10 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-08-25 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-08-26 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-08-31 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-09-02 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-10-05 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-10-06 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-10-07 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-10-12 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-10-13 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-10-14 12:00:00],
#   [
#   ],
#   [ [] ]
# )
#
# show = create_show.(
#   ~N[2017-10-26 12:00:00],
#   [
#   ],
#   [ [] ]
# )

import Ecto.Query, only: [from: 2]
perfs = Repo.all from perf in SongPerformance,
  join: song in assoc(perf, :song),
  join: set in assoc(perf, :set),
  where: perf.song_id == song.id,
  where: perf.set_id == set.id, # TODO how to pull show of this set?
  preload: [song: song, set: set] 
perfs
|> Enum.map(&"##{&1.position} : #{&1.song.name}")
|> Enum.join("\n")
|> IO.puts
