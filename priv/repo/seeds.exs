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
#     $> Path.join([:code.priv_dir(:jrad_net), "repo", "seeds.exs"]) |> Code.eval_file

alias JradNet.{
  Repo,
  Show,
  Set,
  Song,
  SongPerformance,
}

s = %{
  alabamagetaway: Repo.insert!(%Song{name: "Alabama Getaway"}),
  alligator: Repo.insert!(%Song{name: "Alligator"}),
  althea: Repo.insert!(%Song{name: "Althea"}),
  atasiding: Repo.insert!(%Song{name: "At A Siding"}), # part of Terrapin Suite

  biodtl: Repo.insert!(%Song{name: "Beat It On Down The Line"}),
  bertha: Repo.insert!(%Song{name: "Bertha"}),
  bigrailroad: Repo.insert!(%Song{name: "Big Railroad Blues"}),
  bigriver: Repo.insert!(%Song{name: "Big River"}),
  birdsong: Repo.insert!(%Song{name: "Bird Song"}),
  blackpeter: Repo.insert!(%Song{name: "Black Peter"}),
  blackthroated: Repo.insert!(%Song{name: "Black Throated Wind"}),
  blues4allah: Repo.insert!(%Song{name: "Blues For Allah"}),
  bornXeyed: Repo.insert!(%Song{name: "Born Cross Eyed"}),
  boxofrain: Repo.insert!(%Song{name: "Box Of Rain"}),
  brokedown: Repo.insert!(%Song{name: "Brokedown Palace"}),
  browneyedwomen: Repo.insert!(%Song{name: "Brown-Eyed Women"}),
  built2last: Repo.insert!(%Song{name: "Built To Last"}),

  candyman: Repo.insert!(%Song{name: "Candyman"}),
  cantturn: Repo.insert!(%Song{name: "Can't Turn You Loose"}),
  caseyjones: Repo.insert!(%Song{name: "Casey Jones"}),
  cassidy: Repo.insert!(%Song{name: "Cassidy"}),
  caution: Repo.insert!(%Song{name: "Caution (Do Not Stop On Tracks)"}),
  chinacat: Repo.insert!(%Song{name: "China Cat Sunflower"}),
  coldrain: Repo.insert!(%Song{name: "Cold Rain and Snow"}),
  cosmiccharlie: Repo.insert!(%Song{name: "Cosmic Charlie"}),
  crazyfingers: Repo.insert!(%Song{name: "Crazy Fingers"}),
  creampuff: Repo.insert!(%Song{name: "Cream Puff War"}),
  cryptical: Repo.insert!(%Song{name: "Cryptical Envelopment"}),
  cumberland: Repo.insert!(%Song{name: "Cumberland Blues"}),

  dancin: Repo.insert!(%Song{name: "Dancing In The Streets"}),
  darkhollow: Repo.insert!(%Song{name: "Dark Hollow"}),
  darkstar: Repo.insert!(%Song{name: "Dark Star"}),
  deal: Repo.insert!(%Song{name: "Deal"}),
  deepelem: Repo.insert!(%Song{name: "Deep Elem Blues"}),
  direwolf: Repo.insert!(%Song{name: "Dire Wolf"}),
  thatrag: Repo.insert!(%Song{name: "Doin' That Rag"}),
  dontease: Repo.insert!(%Song{name: "Don't Ease Me In"}),
  drums: Repo.insert!(%Song{name: "Drums"}),
  duprees: Repo.insert!(%Song{name: "Dupree's Diamond Blues"}),

  easywind: Repo.insert!(%Song{name: "Easy Wind"}),
  estimated: Repo.insert!(%Song{name: "Estimated Prophet"}),
  eyes: Repo.insert!(%Song{name: "Eyes Of The World"}),

  stranger: Repo.insert!(%Song{name: "Feel Like A Stranger"}),
  firemtn: Repo.insert!(%Song{name: "Fire On The Mountain"}),
  franklins: Repo.insert!(%Song{name: "Franklin's Tower"}),
  frienddevil: Repo.insert!(%Song{name: "Friend Of The Devil"}),

  gdtrfb: Repo.insert!(%Song{name: "Going Down The Road Feeling Bad"}),
  goldenroad: Repo.insert!(%Song{name: "Golden Road (To Unlimited Devotion)"}),
  gonesville: Repo.insert!(%Song{name: "Gonesville", author: "Bob Weir"}),
  goodlovin: Repo.insert!(%Song{name: "Good Lovin'"}),
  greateststory: Repo.insert!(%Song{name: "Greatest Story Ever Told"}),

  happybirthday: Repo.insert!(%Song{name: "Happy Birthday", author: "(trad)"}),
  hesgone: Repo.insert!(%Song{name: "He's Gone"}),
  heartbreaker: Repo.insert!(%Song{name: "Heartbreaker"}),
  hellbucket: Repo.insert!(%Song{name: "Hell In A Bucket"}),
  help: Repo.insert!(%Song{name: "Help On The Way"}),
  sunshine: Repo.insert!(%Song{name: "Here Comes Sunshine"}),

  rider: Repo.insert!(%Song{name: "I Know You Rider"}),
  needamiracle: Repo.insert!(%Song{name: "I Need A Miracle"}),
  elizabethreed: Repo.insert!(%Song{name: "In Memory of Elizabeth Reed", author: "Allman Brothers Band"}),

  jackaroe: Repo.insert!(%Song{name: "Jack A Roe"}),
  jackstraw: Repo.insert!(%Song{name: "Jack Straw"}),
  jam: Repo.insert!(%Song{name: "Jam"}),

  kashmir: Repo.insert!(%Song{name: "Kashmir", author: "Led Zeppelin"}),
  killercars: Repo.insert!(%Song{name: "Killer Cars", author: "Radiohead"}),
  kingsolomons: Repo.insert!(%Song{name: "King Solomon's Marbles"}),

  ladywithfan: Repo.insert!(%Song{name: "Lady With a Fan"}), # part of Terrapin Suite
  lazylightning: Repo.insert!(%Song{name: "Lazy Lightning"}),
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
  halfstep: Repo.insert!(%Song{name: "Mississippi Halfstep Uptown Toodeloo"}),
  morningdew: Repo.insert!(%Song{name: "Morning Dew"}),
  mtnsmoon: Repo.insert!(%Song{name: "Mountains Of The Moon"}),
  mrcharlie: Repo.insert!(%Song{name: "Mr. Charlie"}),
  musthavebeen: Repo.insert!(%Song{name: "Must Have Been The Roses"}),
  brotheresau: Repo.insert!(%Song{name: "My Brother Esau"}),

  minglewood: Repo.insert!(%Song{name: "New Minglewood Blues"}),
  newspeedway: Repo.insert!(%Song{name: "New Speedway Boogie"}),
  nfa: Repo.insert!(%Song{name: "Not Fade Away"}),

  saturdaynight: Repo.insert!(%Song{name: "One More Saturday Night"}),
  ontheroad: Repo.insert!(%Song{name: "On The Road Again"}),

  passenger: Repo.insert!(%Song{name: "Passenger"}),
  playin: Repo.insert!(%Song{name: "Playin' In The Band"}),
  pridecucamonga: Repo.insert!(%Song{name: "Pride of Cucamonga"}),
  promisedland: Repo.insert!(%Song{name: "Promised Land", author: "Chuck Berry"}),

  mightyquinn: Repo.insert!(%Song{name: "Quinn The Eskimo", author: "Bob Dylan"}),

  raceison: Repo.insert!(%Song{name: "Race Is On"}),
  ramble: Repo.insert!(%Song{name: "Ramble On Rose"}),
  reubencherise: Repo.insert!(%Song{name: "Reuben & Cherise"}),
  ripple: Repo.insert!(%Song{name: "Ripple"}),
  rowjimmy: Repo.insert!(%Song{name: "Row Jimmy"}),

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
  sugarmag: Repo.insert!(%Song{name: "Sugar Magnolia"}),
  sugaree: Repo.insert!(%Song{name: "Sugaree"}),
  ssdd: Repo.insert!(%Song{name: "Sunshine Daydream"}),
  supplication: Repo.insert!(%Song{name: "Supplication"}),

  tennesseejed: Repo.insert!(%Song{name: "Tennessee Jed"}),
  # TODO decide what to do about the Terrapin suite...
  # "Terrapin" and "Terrapin Refrain" aren't listed in JRADBase v1
  # terrapin: Repo.insert!(%Song{name: "Terrapin"}),
  terrapinflyer: Repo.insert!(%Song{name: "Terrapin Flyer"}),
  # terrapinrefrain: Repo.insert!(%Song{name: "Terrapin Refrain"}),
  terrapinstation: Repo.insert!(%Song{name: "Terrapin Station"}),
  terrapintransit: Repo.insert!(%Song{name: "Terrapin Transit"}),
  the11: Repo.insert!(%Song{name: "The Eleven"}),
  musicneverstopped: Repo.insert!(%Song{name: "The Music Never Stopped"}),
  other1: Repo.insert!(%Song{name: "The Other One"}),
  stranger2souls: Repo.insert!(%Song{name: "The Stranger (Two Souls In Communion)"}),
  wheel: Repo.insert!(%Song{name: "The Wheel"}),
  theyloveeachother: Repo.insert!(%Song{name: "They Love Each Other"}),
  throwingstones: Repo.insert!(%Song{name: "Throwing Stones"}),
  tilthemorningcomes: Repo.insert!(%Song{name: "Til The Morning Comes"}),
  touchofgrey: Repo.insert!(%Song{name: "Touch Of Grey"}),
  truckin: Repo.insert!(%Song{name: "Truckin'"}),
  lovelight: Repo.insert!(%Song{name: "Turn On Your Lovelight"}),

  usblues: Repo.insert!(%Song{name: "U.S. Blues"}),
  unbrokenchain: Repo.insert!(%Song{name: "Unbroken Chain"}),
  unclejohns: Repo.insert!(%Song{name: "Uncle John's Band"}),

  violalee: Repo.insert!(%Song{name: "Viola Lee Blues"}),

  webidyou: Repo.insert!(%Song{name: "We Bid You Goodnight"}),
  weatherreport: Repo.insert!(%Song{name: "Weather Report Suite"}), # instances can be marked: prelude, part 1, part 2/Let It Grow
  westla: Repo.insert!(%Song{name: "West LA Fadeaway"}),
  wharfrat: Repo.insert!(%Song{name: "Wharf Rat"}),
  womenaresmarter: Repo.insert!(%Song{name: "Women Are Smarter"}),
}

create_show = fn (date, sets, encores) ->
  # TODO don't create the show if one exists on that date
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

~S"""
for {date, sets, encores} <- [
  {
    ~N[2013-01-26 12:00:00],
    [
      [s.bertha, s.althea, s.jackstraw, s.deal, s.mrcharlie, s.browneyedwomen, s.tennesseejed, s.shakedown, s.chinacat, s.rider],
      [s.estimated, s.eyes, s.help, s.slip, s.franklins, s.ststephen, s.the11, s.caution, s.other1, s.violalee]
    ],
    [ [s.usblues] ]
  },
  {
    ~N[2013-12-27 12:00:00],
    [
      [s.creampuff, s.truckin, s.duprees, s.cumberland, s.rowjimmy, s.bertha, s.easywind, s.shakedown],
      [s.scarlet, s.firemtn, s.playin, s.althea, s.lovelight, s.terrapinstation, s.terrapintransit, s.atasiding, s.terrapinflyer]
    ],
    [ [s.brokedown] ]
  },
  {
    ~N[2014-08-01 12:00:00],
    [
      [s.unclejohns, s.lazylightning, s.ststephen, s.the11, s.caseyjones, s.deal, s.magnificent, s.reubencherise, s.eyes, s.lazylightning, s.unclejohns], # 2nd lazylightning & unclejohns are reprise
    ],
    []
  },
  {
    ~N[2014-09-19 12:00:00],
    [
      [s.biodtl, s.frienddevil, s.cumberland, s.violalee, s.unclejohns, s.truckin, s.other1],
      [s.atasiding, s.shakedown, s.chinacat, s.the11, s.rider, s.wheel, s.ladywithfan, s.terrapinstation, s.terrapintransit, s.atasiding, s.terrapinflyer]
    ],
    [ [s.lonesomewhistle] ]
  },
  {
    ~N[2014-09-20 12:00:00],
    [
      [s.coldrain, s.bertha, s.saturdaynight, s.althea, s.playin, s.unbrokenchain],
      [s.help, s.slip, s.franklins, s.weatherreport, s.morningdew, s.ststephen]
    ],
    [ [s.nfa] ]
  },
  {
    ~N[2014-10-05 12:00:00],
    [
      [s.alligator, s.scarlet, s.firemtn, s.ststephen, s.rider, s.ladywithfan, s.terrapinstation]
    ],
    [ ]
  },
  {
    ~N[2014-10-10 12:00:00],
    [
      [s.goldenroad, s.crazyfingers, s.mrcharlie, s.hesgone, s.loser, s.sugaree, s.violalee],
      [s.alligator, s.eyes, s.kingsolomons, s.darkstar, s.scarlet, s.firemtn]
    ],
    [ [s.ripple] ]
  },
  {
    ~N[2014-10-11 12:00:00],
    [
      [s.musicneverstopped, s.browneyedwomen, s.birdsong, s.rider, s.easywind, s.nfa],
      [s.shakedown, s.estimated, s.ladywithfan, s.terrapinstation, s.terrapintransit, s.atasiding, s.terrapinflyer, s.reubencherise, s.throwingstones, s.stella]
    ],
    [ [s.brokedown, s.happybirthday] ]
  },
  {
    ~N[2014-11-02 12:00:00],
    [
      [s.truckin, s.unclejohns, s.noquarter, s.weatherreport, s.crazyfingers, s.help, s.slip, s.franklins]
    ],
    [ ]
  },
  {
    ~N[2014-12-29 12:00:00],
    [
      [s.truckin, s.jackstraw, s.estimated, s.eyes, s.crazyfingers, s.kingsolomons, s.boxofrain],
      [s.masonschildren, s.throwingstones, s.darkstar, s.watchtower, s.darkstar, s.wheel, s.darkstar, s.ladywithfan, s.terrapinstation, s.rider]
    ],
    [ [s.shakedown] ]
  },
  {
    ~N[2014-12-30 12:00:00],
    [
      [s.biodtl, s.althea, s.browneyedwomen, s.pridecucamonga, s.chinacat, s.caseyjones],
      [s.help, s.slip, s.franklins, s.mtnsmoon, s.revolution9, s.other1]
    ],
    [ [s.reubencherise] ]
  },
  {
    ~N[2014-12-31 12:00:00],
    [
      [s.goldenroad, s.violalee, s.cumberland, s.violalee, s.hellbucket, s.violalee], # hmmmm
      [s.playin, s.ramble, s.musicneverstopped, s.unbrokenchain, s.scarlet, s.firemtn, s.happybirthday],
      [s.unclejohns, s.space, s.weatherreport, s.birdsong, s.nfa]
    ],
    [ ]
  },
  {
    ~N[2015-01-23 12:00:00],
    [
      [s.alabamagetaway, s.millionaire, s.greateststory, s.blackpeter, s.lostsailor, s.stofcircumstance, s.bigrailroad],
      [s.stranger, s.staggerlee, s.aiko, s.halfstep, s.sugarmag, s.ssdd, s.missionrain]
    ],
    [ [s.theyloveeachother] ]
  },
  {
    ~N[2015-01-24 12:00:00],
    [
      [s.alligator, s.caution, s.elizabethreed, s.jackaroe, s.unclejohns, s.ophelia, s.ramble, s.onlydaddy, s.bertha],
      [s.musicneverstopped, s.cumberland, s.help, s.slip, s.shakedown, s.truckin, s.morningdew]
    ],
    [ [s.browneyedwomen] ]
  },
  {
    ~N[2015-02-05 12:00:00],
    [
      [s.musicneverstopped, s.scarlet, s.bertha, s.estimated, s.crazyfingers, s.mrcharlie, s.browneyedwomen],
      [s.space, s.help, s.slip, s.franklins, s.hesgone, s.truckin, s.other1]
    ],
    [ [s.lonesomewhistle] ]
  },
  {
    ~N[2015-02-06 12:00:00],
    [
      [s.chinacat, s.rider, s.easywind, s.violalee, s.althea, s.weatherreport],
      [s.birdsong, s.playin, s.eyes, s.wheel, s.unclejohns, s.ladywithfan, s.terrapinstation, s.terrapintransit, s.atasiding, s.terrapinflyer]
    ],
    [ [s.nfa] ]
  },
  {
    ~N[2015-02-07 12:00:00],
    [
      [s.cassidy, s.jackstraw, s.reubencherise, s.throwingstones, s.firemtn, s.gdtrfb, s.webidyou],
      [s.suchanight, s.ststephen, s.caution, s.the11, s.greateststory, s.wheel, s.wharfrat, s.sugarmag, s.ssdd]
    ],
    [ [s.brokedown] ]
  },
  {
    ~N[2015-02-08 12:00:00],
    [
      [s.creampuff, s.samsondelilah, s.caseyjones, s.cumberland, s.minglewood, s.deal],
      [s.lazylightning, s.supplication, s.darkstar, s.kingsolomons, s.stella, s.lostsailor, s.stofcircumstance]
    ],
    [ [s.shakedown] ]
  },
  {
    ~N[2015-02-14 12:00:00],
    [
      [s.help, s.slip, s.franklins, s.stranger, s.althea, s.wheel, s.saturdaynight],
      [s.chinacat, s.gdtrfb, s.webidyou, s.theyloveeachother, s.lostsailor, s.stofcircumstance, s.ladywithfan, s.terrapinstation, s.terrapintransit, s.atasiding, s.terrapinflyer]
    ],
    [ [s.morningdew] ]
  },
  {
    ~N[2015-02-15 12:00:00],
    [
      [s.bertha, s.greateststory, s.ramble, s.samsondelilah, s.space, s.cumberland, s.shakedown],
      [s.shakedown, s.alabamagetaway, s.ststephen, s.the11, s.truckin, s.halfstep, s.hellbucket]
    ],
    [ [s.touchofgrey] ]
  },
  {
    ~N[2015-02-16 12:00:00],
    [
      [s.drums, s.darkstar, s.eyes, s.memyuncle, s.westla, s.playin],
      [s.sugarmag, s.aiko, s.magnificent, s.throwingstones, s.unbrokenchain, s.throwingstones, s.ssdd]
    ],
    [ [s.looselucy, s.nfa, s.looselucy, s.nfa] ]
  },
  {
    ~N[2015-04-22 12:00:00],
    [
      [s.weatherreport, s.help, s.slip, s.mobydick, s.ladywithfan, s.terrapinstation, s.terrapintransit, s.atasiding, s.terrapinflyer],
      [s.playin, s.ramble, s.truckin, s.chinacat, s.the11, s.rider]
    ],
    [ [s.violalee] ]
  },
  {
    ~N[2015-04-23 12:00:00],
    [
      [s.memyuncle, s.browneyedwomen, s.unclejohns, s.estimated, s.eyes, s.stofcircumstance],
      [s.goldenroad, s.jackstraw, s.reubencherise, s.nfa, s.jam, s.easywind, s.wheel, s.mightyquinn]
    ],
    [ [s.sugarmag, s.ssdd] ]
  },
  {
    ~N[2015-04-24 12:00:00],
    [
      [s.musicneverstopped, s.sunshine, s.throwingstones, s.scarlet, s.firemtn, s.ophelia],
      [s.alligator, s.crazyfingers, s.mrcharlie, s.kingsolomons, s.morningdew, s.franklins]
    ],
    [ [s.bertha] ]
  },
  {
    ~N[2015-04-25 12:00:00],
    [
      [s.biodtl, s.caseyjones, s.candyman, s.greateststory, s.halfstep, s.stranger],
      [s.althea, s.blackthroated, s.shakedown, s.ststephen, s.other1, s.saturdaynight]
    ],
    [ [s.gdtrfb, s.webidyou] ]
  },
  {
    ~N[2015-05-01 12:00:00],
    [
      [s.truckin, s.wheel, s.unclejohns, s.hesgone, s.easywind, s.reubencherise, s.eyes],
      [s.help, s.slip, s.throwingstones, s.violalee, s.cumberland, s.violalee]
    ],
    [ [s.slip, s.franklins] ]
  },
  {
    ~N[2015-05-02 12:00:00],
    [
      [s.musicneverstopped, s.crazyfingers, s.other1, s.space, s.ststephen, s.gdtrfb, s.sugarmag, s.ssdd],
      [s.shakedown, s.estimated, s.the11, s.rider, s.ladywithfan, s.terrapinstation, s.terrapintransit, s.atasiding, s.terrapinflyer]
    ],
    [ [s.lonesomewhistle, s.saturdaynight] ]
  },
  {
    ~N[2015-05-09 12:00:00],
    [
      [s.dancin, s.direwolf, s.cassidy, s.ststephen, s.stranger2souls, s.eyes, s.nfa],
      [s.musicneverstopped, s.kingsolomons, s.chinacat, s.the11, s.rider, s.morningdew, s.saturdaynight] # three repeats!
    ],
    [ [s.ripple] ]
  },
  {
    ~N[2015-05-16 12:00:00],
    [
      [s.alligator, s.franklins, s.blackthroated, s.cryptical, s.other1, s.scarlet, s.firemtn],
      [s.help, s.slip, s.cumberland, s.bertha, s.shakedown, s.greateststory, s.ramble]
    ],
    [ [s.sugarmag, s.ssdd] ]
  },
  {
    ~N[2015-05-22 12:00:00],
    [
      [s.nfa, s.browneyedwomen, s.truckin, s.ladywithfan, s.terrapinstation, s.terrapintransit, s.atasiding, s.terrapinflyer, s.wheel]
    ],
    []
  },
  {
    ~N[2015-05-23 12:00:00],
    [
      [s.dancin, s.the11, s.help, s.slip, s.violalee, s.dancin, s.violalee, s.throwingstones, s.bertha]
    ],
    [ [s.unclejohns] ]
  },
  {
    ~N[2015-05-24 12:00:00],
    [
      [s.jam, s.reubencherise, s.eyes, s.mrcharlie, s.shakedown, s.playin, s.chinacat, s.rider],
      [s.weatherreport, s.halfstep, s.estimated, s.theyloveeachother, s.greateststory, s.ststephen, s.gdtrfb] # weather report is part 2
    ],
    [ [s.cumberland] ]
  },
  {
    ~N[2015-05-30 12:00:00],
    [
      [s.samsondelilah, s.althea, s.truckin, s.hesgone, s.lostsailor, s.stofcircumstance, s.unclejohns],
      [s.blackpeter, s.playin, s.scarlet, s.cassidy, s.firemtn, s.saturdaynight]
    ],
    [ [s.sugaree] ]
  },
  {
    ~N[2015-06-03 12:00:00],
    [
      [s.alabamagetaway, s.easywind, s.birdsong, s.other1, s.atlanticcity, s.womenaresmarter, s.rider],
      [s.deal, s.stranger, s.suchanight, s.shakedown, s.cumberland, s.stella, s.jackstraw]
    ],
    [ [s.sugarmag, s.ssdd] ]
  },
  {
    ~N[2015-06-05 12:00:00],
    [
      [s.jam, s.ladywithfan, s.terrapinstation, s.terrapintransit, s.atasiding, s.terrapinflyer, s.wheel, s.greateststory, s.cumberland]
    ],
    []
  },
  {
    ~N[2015-06-06 12:00:00],
    [
      [s.jam, s.truckin, s.the11, s.rider, s.help, s.slip, s.throwingstones, s.shakedown]
    ],
    []
  },
  {
    ~N[2015-06-25 12:00:00],
    [
      [s.jam, s.truckin, s.nfa, s.browneyedwomen, s.minglewood, s.ststephen, s.mrcharlie, s.chinacat, s.rider, s.saturdaynight]
    ],
    []
  },
  {
    ~N[2015-07-05 12:00:00],
    [
      [s.mamatried, s.help, s.slip, s.unclejohns, s.weatherreport, s.hesgone, s.throwingstones], # weather report is part 2
      [s.shakedown, s._50ways, s.cumberland, s.estimated, s.space, s.wheel, s.stofcircumstance, s.morningdew, s.samsondelilah] # wheel w/terrapin station jam
    ],
    [ [s.mightyquinn] ]
  },
  {
    ~N[2015-07-10 12:00:00],
    [
      [s.jam, s.reubencherise, s.stranger, s.kingsolomons, s.alligator, s.franklins, s.sugarmag, s.ssdd]
    ],
    []
  },
  {
    ~N[2015-08-08 12:00:00],
    [
      [s.jam, s.dontease, s.ststephen, s.truckin, s.crazyfingers, s.musicneverstopped, s.eyes, s.dancin] # dancin closer
    ],
    []
  },
  {
    ~N[2015-08-14 12:00:00],
    [
      [s.jam, s.lazylightning, s.bertha, s.violalee, s.weatherreport, s.unclejohns, s.greateststory] # weather report is part 2
    ],
    []
  },
  {
    ~N[2015-08-22 12:00:00],
    [
      [s.jam, s.jackstraw, s.brotheresau, s.rowjimmy, s.minglewood, s.help, s.slip, s.stranger, s.browneyedwomen, s.blackthroated, s.rider, s.nfa]
    ],
    [ [s.saturdaynight] ]
  },
  {
    ~N[2015-09-04 12:00:00],
    [
      [s.jam, s.mamatried, s.althea, s.greateststory, s.ststephen, s.the11, s.caution, s.ststephen, s.shakedown, s.weatherreport, s.slip, s.weatherreport] # weather report is part 2 then reprise
    ],
    []
  },
  {
    ~N[2015-09-06 12:00:00],
    [
      [s.jam, s.jackaroe, s.truckin, s.wheel, s.unclejohns, s.unbrokenchain, s.missionrain, s.ladywithfan, s.terrapinstation, s.terrapintransit, s.atasiding, s.terrapinflyer],
      [s.help, s.slip, s.franklins, s.throwingstones, s.rider, s.drums, s.nfa, s.samsondelilah] # three slips in a row
    ],
    [ [s.bertha] ]
  },
  {
    ~N[2015-09-19 12:00:00],
    [
      [s.wheel, s.ramble, s.playin, s.cumberland, s.deal, s.brotheresau, s.chinacat, s.rider, s.kingsolomons, s.sugaree, s.saturdaynight, s.nfa]
    ],
    [ [s.scarlet] ]
  },
  {
    ~N[2015-10-02 12:00:00],
    [
      [s.bornXeyed, s.shakedown, s.stranger, s.standingmoon, s.wheel, s.ladywithfan, s.terrapinstation], # three wheels in a row
      [s.built2last, s.weatherreport, s.atlanticcity, s.rider, s.jam, s.playin, s.brokedown, s.lostsailor, s.stofcircumstance] # weather report is part 2; three riders in a row
    ],
    [ [s.sugaree] ]
  },
  {
    ~N[2015-10-03 12:00:00],
    [
      [s.musicneverstopped, s.dancin, s.rowjimmy, s.stranger2souls, s.other1, s.cryptical, s.truckin],
      [s.scarlet, s.firemtn, s.lookslikerain, s.ststephen, s.tennesseejed, s.ststephen, s.tennesseejed, s.violalee, s.becky, s.violalee, s.stella, s.gdtrfb, s.webidyou]
    ],
    [ [s.saturdaynight] ]
  },
  {
    ~N[2015-10-04 12:00:00],
    [
      [s.promisedland, s.unclejohns, s.direwolf, s.estimated, s.eyes, s.kingsolomons, s.brotheresau],
      [s.darkstar, s.wharfrat, s.darkstar, s.the11, s.ststephen, s.help, s.slip, s.throwingstones, s.superstition, s.throwingstones, s.morningdew]
    ],
    [ [s.samsondelilah] ]
  },
  {
    ~N[2015-10-28 12:00:00],
    [
      [s.alligator, s.bertha, s.violalee, s.mrcharlie, s.rowjimmy, s.greateststory],
      [s.bornXeyed, s.other1, s.birdsong, s.the11, s.nfa, s.sugarmag, s.ssdd]
    ],
    [ [s.gdtrfb, s.webidyou] ]
  },
  {
    ~N[2015-10-29 12:00:00],
    [
      [s.bigrailroad, s.dancin, s.browneyedwomen, s.estimated, s.eyes, s.musicneverstopped, s.fame, s.help, s.myxomatosis, s.slip, s.chinacat, s.kingsolomons, s.chinacat, s.rider, s.franklins, s.slip, s.franklins, s.lonesomewhistle]
    ],
    []
  },
  {
    ~N[2015-10-30 12:00:00],
    [
      [s.althea, s.truckin, s.crazyfingers, s.brotheresau, s.tennesseejed, s.stranger],
      [s.weatherreport, s.scarlet, s.firemtn, s.blackthroated, s.jackstraw, s.blackthroated, s.jackstraw, s.morningdew] # weather report is part 2
    ],
    [ [s.mightyquinn] ]
  },
  {
    ~N[2015-10-31 12:00:00],
    [
      [s.promisedland, s.playin, s.reubencherise, s.vampireblues, s.throwingstones, s.ladywithfan, s.terrapinstation, s.terrapintransit, s.atasiding, s.terrapinflyer],
      [s.ststephen, s.bends, s.wheel, s.unclejohns, s.kingsolomons, s.unclejohns, s.killercars, s.shakedown, s.myxomatosis, s.cumberland, s.saturdaynight]
    ],
    [ [s.halloweentheme, s.werewolves] ]
  },
  {
    ~N[2015-11-27 12:00:00],
    [
      [s.alligator, s.slip, s.greateststory, s.candyman, s.ststephen, s.the11, s.ststephen, s.sugarmag, s.ssdd],
      [s.rowjimmy, s.truckin, s.cassidy, s.tennesseejed, s.mrcharlie, s.dancin, s.drums, s.dancin, s.estimated, s.browneyedwomen]
    ],
    [ [s.gdtrfb, s.webidyou] ]
  },
  {
    ~N[2015-11-28 12:00:00],
    [
      [s.bertha, s.throwingstones, s.blackpeter, s.estimated, s.weight, s.scarlet, s.firemtn],
      [s.sunshine, s.stranger, s.help, s.slip, s.jackaroe, s.cumberland, s.saturdaynight]
    ],
    [ [s.shakedown] ]
  },
], do: create_show.(date, sets, encores)

import Ecto.Query, only: [from: 2]
perfs = Repo.all from perf in SongPerformance,
  join: song in assoc(perf, :song),
  join: set in assoc(perf, :set),
  where: perf.song_id == song.id,
  where: perf.set_id == set.id, # TODO how to pull show of this set?
  preload: [song: song, set: set] 
song_count = Repo.aggregate(Song, :count, :id)
show_count = Repo.aggregate(Show, :count, :id)
IO.puts "#{song_count} songs played at #{show_count} shows for #{length(perfs)} song performances."
"""
