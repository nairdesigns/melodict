require 'json'
require 'cloudinary'
require 'cloudinary/uploader'
require 'cloudinary/utils'

# // Config
Cloudinary.config do |config|
  config.cloud_name = 'dql3aujqv'
  config.api_key = '267434198476322'
  config.api_secret = 'KFfWZ_0a8Ve5LX20oUPZDyiFGus'
  config.secure = true
end

# // Upload
Cloudinary::Uploader.upload "https://upload.wikimedia.org/wikipedia/commons/a/ae/Olympic_flag.jpg", :public_id => "olympic_flag"

# // Transform
Cloudinary::Utils.cloudinary_url("olympic_flag", :width => 100, :height => 150, :crop => "fill")
def warmup_exercise
  sarah = User.find_by(email: 'sarah@lickwars.com')
  warmup =
    Exercise.create(
      difficulty: 2.0,
      name: 'Warmup melody',
      description: "Let's start easy",
      chord_progression: 'I',
      user: sarah
    )

  # Question
  Music.create(
    bpm: 80,
    key_signature: 2,
    notes: JSON[[['C4', 4], ['D4', 4], ['E4', 4], ['A4', 4]]],
    chords: JSON[[[%w[C3 E3 A3], 1]]],
    user: warmup.user,
    is_question: true,
    status: 1,
    exercise: warmup
  )

  # Attempts
  User
    .all
    .sample(rand(3..15))
    .each do |user|
      Music.create(
        bpm: 80,
        key_signature: 2,
        notes: JSON[[['C4', 4], ['D4', 4], ['E4', 4], ['B4', 4]]],
        chords: JSON[[[%w[C3 E3 G3], 1]]],
        user: user,
        is_question: false,
        status: 0,
        exercise: warmup
      )
    end
end

def twinkle_exercise
  sarah = User.find_by(email: 'sarah@lickwars.com')
  twinkle =
    Exercise.create(
      difficulty: 6.99,
      name: '⭐ Twinkle twinkle little star ⭐',
      description: 'An all time favorite made famous by Mozart',
      chord_progression: 'I - IV - V - I',
      user: sarah
    )

  # Question
  Music.create(
    bpm: 80,
    key_signature: 2,
    notes:
      JSON[
        [
          ['C4', 4],
          ['C4', 4],
          ['G4', 4],
          ['G4', 4],
          ['A4', 4],
          ['A4', 4],
          ['G4', 2],
          ['F4', 4],
          ['F4', 4],
          ['E4', 4],
          ['E4', 4],
          ['D4', 8],
          ['E4', 8],
          ['F4', 8],
          ['D4', 8],
          ['C4', 2]
        ]
      ],
    chords:
      JSON[
        [
          [%w[C3 E3 G3], 1],
          [%w[C3 F3 A3], 2],
          [%w[C3 E3 G3], 2],
          [%w[D3 F3 G3 B3], 2],
          [%w[E3 G3 C4], 2],
          [%w[F3 A3 C4], 4],
          [%w[G3 B3], 4],
          [%w[C3 E3 G3], 2]
        ]
      ],
    user: twinkle.user,
    is_question: true,
    status: 1,
    exercise: twinkle
  )

  # Attempts
  # User
  #   .all
  #   .sample(rand(3..8))
  #   .each do |user|
  #     Music.create(
  #       bpm: 80,
  #       key_signature: 2,
  #       notes:
  #         JSON[
  #           [
  #             [['r', 'A4'], 4],
  #             [['r', 'A4'], 4],
  #             [['r', 'A4'], 4],
  #             [['r', 'A4'], 4],
  #             [['r', 'A4'], 4],
  #             [['r', 'A4'], 4],
  #             [['r', 'A4'], 2],
  #             [['r', 'A4'], 4],
  #             [['r', 'A4'], 4],
  #             [['r', 'A4'], 4],
  #             [['r', 'A4'], 4],
  #             [['r', 'A4'], 8],
  #             [['r', 'A4'], 8],
  #             [['r', 'A4'], 8],
  #             [['r', 'A4'], 8],
  #             [['r', 'A4'], 2]
  #           ]
  #         ],
  #       chords:
  #         JSON[
  #           [
  #             [%w[C3 E3 G3], 1],
  #             [%w[C3 F3 A3], 2],
  #             [%w[C3 E3 G3], 2],
  #             [%w[D3 F3 G3 B3], 2],
  #             [%w[E3 G3 C4], 2],
  #             [%w[F3 A3 C4], 4],
  #             [%w[G3 B3], 4],
  #             [%w[C3 E3 G3], 2]
  #           ]
  #         ],
  #       user: user,
  #       is_question: false,
  #       status: rand(0..1),
  #       exercise: twinkle
  #     )
  #   end
end

def power_users
  # == Power users =============================
  tom = User.new(email: 'tom@lickwars.com', password: '123456', name: 'Tom')
  sarah =
    User.new(email: 'sarah@lickwars.com', password: '123456', name: 'Sarah')
  hiromi =
    User.new(email: 'hiromi@lickwars.com', password: '123456', name: 'Hiromi')
  johann =
    User.new(email: 'johann@lickwars.com', password: '123456', name: 'Johann')
  ladygogo =
    User.new(
      email: 'ladygogo@lickwars.com',
      password: '123456',
      name: 'LadyGogo'
    )

  tom.profile_picture.attach(
    io:
      URI.open(
        'https://m.media-amazon.com/images/M/MV5BMTU5M2Y5M2QtYmQ3Yi00YjBhLTgyNzEtNDhlMGNiZDRkOTgzXkEyXkFqcGdeQXVyNjc3NDgwNzU@._V1_.jpg'
      ),
    filename: 'Tom_profile_pic.png',
    content_type: 'image/png'
  )

  sarah.profile_picture.attach(
    io:
      URI.open(
        'http://www.anomalypodcast.com/wp-content/uploads/2016/05/Terminator_Feature1.jpg'
      ),
    filename: 'Sarah_profile_pic.png',
    content_type: 'image/png'
  )

  hiromi.profile_picture.attach(
    io:
      URI.open(
        'https://www.eventworld.co/blob/images/pg/hiromi-uehara_1b95b097d3_1000.jpg'
      ),
    filename: 'Hiromi_profile_pic.png',
    content_type: 'image/png'
  )

  johann.profile_picture.attach(
    io:
      URI.open(
        'https://www.bach-cantatas.com/thefaceofbach/Pic-FOB/1760-08-wdheq-if-300.jpg'
      ),
    filename: 'Johann_profile_pic.png',
    content_type: 'image/png'
  )

  ladygogo.profile_picture.attach(
    io:
      URI.open(
        'https://cdn.trendhunterstatic.com/phpthumbnails/69/69406/69406_1_600.jpeg'
      ),
    filename: 'LadyGogo_profile_pic.png',
    content_type: 'image/png'
  )

  tom.save
  sarah.save
  hiromi.save
  johann.save
  ladygogo.save
  # ========================
end

def exercises
  sarah = User.find_by(email: 'sarah@lickwars.com')
  hiromi = User.find_by(email: 'hiromi@lickwars.com')
  johann = User.find_by(email: 'johann@lickwars.com')
  ladygogo = User.find_by(email: 'ladygogo@lickwars.com')

  # Exercises made by power users ==========================
  5.times do |i_exercise|
    Exercise.create(
      difficulty: 0.01 + (i_exercise/5.0)*0.1,
      name: "Warmup ##{i_exercise + 1}",
      description:
        'The I and V chords are the fundamental building blocks of western tonal music. In this series of exercise we train to recognize and understand their usage.',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  6.times do |i_exercise|
    Exercise.create(
      difficulty: 0.1 + (i_exercise/6.0)*0.1,
      name: "Got ryhthm ##{i_exercise + 1}",
      description:
        'The I and V chords are the fundamental building blocks of western tonal music. In this series of exercise we train to recognize and understand their usage.',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  8.times do |i_exercise|
    Exercise.create(
      difficulty: 1.01 + (i_exercise/8.0)*0.1,
      name: "Meet the tonic ##{i_exercise + 1}",
      description:
        'The I and V chords are the fundamental building blocks of western tonal music. In this series of exercise we train to recognize and understand their usage.',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  1.times do |i_exercise|
    Exercise.create(
      difficulty: 1.11 + (i_exercise/1.0)*0.1,
      name: "J'ai du bon tabac",
      description: 'Lorem',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  1.times do |i_exercise|
    Exercise.create(
      difficulty: 1.21 + (i_exercise/1.0)*0.1,
      name: "Au clair de la Lune",
      description: 'Lorem',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  6.times do |i_exercise|
    Exercise.create(
      difficulty: 2.01 + (i_exercise/6.0)*0.1,
      name: "Get pentatonic ##{i_exercise + 1}",
      description: 'Lorem',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end
  4.times do |i_exercise|
    Exercise.create(
      difficulty: 2.1 + (i_exercise/4.0)*0.1,
      name: "Just passing ##{i_exercise + 1}",
      description: 'Lorem',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  5.times do |i_exercise|
    Exercise.create(
      difficulty: 3.01 + (i_exercise/5.0)*0.1,
      name: "A major change ##{i_exercise + 1}",
      description: 'Lorem',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  5.times do |i_exercise|
    Exercise.create(
      difficulty: 3.01 + (i_exercise/5.0)*0.1,
      name: "Happy mood ##{i_exercise + 1}",
      description: 'Lorem',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  4.times do |i_exercise|
    Exercise.create(
      difficulty: 3.11 + (i_exercise/4.0)*0.1,
      name: "Noodling around ##{i_exercise + 1}",
      description: 'Lorem',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end




  # Exercises made by power users ==========================
  11.times do |i_exercise|
    Exercise.create(
      difficulty: 4.01 + (i_exercise/11.0)*0.1,
      name: "The I - V relation ##{i_exercise + 1}",
      description:
        'The I and V chords are the fundamental building blocks of western tonal music. In this series of exercise we train to recognize and understand their usage.',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  # Exercises made by power users ==========================
  7.times do |i_exercise|
    Exercise.create(
      difficulty: 4.11 + (i_exercise/7.0)*0.1,
      name: "Dominating the conversation ##{i_exercise + 1}",
      description:
        'The I and V chords are the fundamental building blocks of western tonal music. In this series of exercise we train to recognize and understand their usage.',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  # Exercises made by power users ==========================
  7.times do |i_exercise|
    Exercise.create(
      difficulty: 5.01 + (i_exercise/7.0)*0.1,
      name: "The sub-dominant ##{i_exercise + 1}",
      description:
        'The I and V chords are the fundamental building blocks of western tonal music. In this series of exercise we train to recognize and understand their usage.',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  5.times do |i_exercise|
    Exercise.create(
      difficulty: 5.01 + (i_exercise/5.0)*0.1,
      name: "Not so dominant ##{i_exercise + 1}",
      description:
        'The I and V chords are the fundamental building blocks of western tonal music. In this series of exercise we train to recognize and understand their usage.',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  5.times do |i_exercise|
    Exercise.create(
      difficulty: 6.01 + (i_exercise/5.0)*0.1,
      name: "The double cadence ##{i_exercise + 1}",
      description: 'Lorem',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  6.times do |i_exercise|
    Exercise.create(
      difficulty: 6.11 + (i_exercise/6.0)*0.1,
      name: "Getting somewhere ##{i_exercise + 1}",
      description: 'Lorem',
      chord_progression: 'I - V - I',
      user: sarah
    )
  end

  # 8.times do |i_exercise|
  #   Exercise.create(
  #     difficulty: 10.01 + (i_exercise/8.0) * 0.9,
  #     name: "Easy licks ##{i_exercise + 1}",
  #     description:
  #       'The ii7 - V7 - IΔ7 (or 2-5-1) progression is the building block of jazz',
  #     chord_progression: 'ii7 - V7 - IΔ7',
  #     user: hiromi
  #   )
  # end

  # progs = [
  #   'I - IV',
  #   'I - V',
  #   'I - V -',
  #   'I - IV - I',
  #   'I - IV -V - I',
  #   'I - V - IV - I'
  # ]
  # 15.times do |i_exercise|
  #   Exercise.create(
  #     difficulty: 7.01 + (i_exercise/15.0)*0.9,
  #     name: "IV vs V chords ##{i_exercise + 1}",
  #     description: 'Learn to recognize melodies using the IV or V chords',
  #     chord_progression: progs.sample,
  #     user: johann
  #   )
  # end

  # progs = ['vi - IV - I - V']

  # 12.times do |i_exercise|
  #   Exercise.create(
  #     difficulty: 6.01 + (i_exercise/12.0)*0.9,
  #     name: "Get pop! ##{i_exercise + 1}",
  #     description:
  #       'The vi - IV - I - V is used in about 80% of the hit pop songs for the last 20 years',
  #     chord_progression: progs.sample,
  #     user: ladygogo
  #   )
  # end
  # ====================================
end

def reviews
  ### Reviews
  # ===================
  puts 'Now creating reviews:'
  comments = [
    'Nice exercise',
    'Good',
    'It was difficult',
    'I like this melody',
    'You are a genius',
    'Great practice',
    'It brings me back to my childhood',
    'The third bar was really tricky',
    'The end has nice twist!',
    'Very Mozartian!',
    'Man, that #11 was spicy!',
    'Nice melody, not too hard',
    'A bit too easy',
    'Classical harmony with a twist',
    "Can't get wrong with those chords",
    'That melody was just classic (in a jazzy way)',
    'Good drills',
    'Now, I realize I need to practice more those basic progressions',
    'The final suspension was the cherry on the cake',
    'It started easy and then... are you insane!',
    'Just what you would expect',
    'Does the job',
    'Perfect drill during my commute',
    'Just the exercise I needed',
    'I always find it difficult to distinguish 4 and 2. This series of exercise is really what I needed',
    'That melody! I almost cried.',
    'I need more of those',
    'Meeeeh...',
    "It didn't disappoint",
    'Vibes of Chopin anyone?',
    'I see someone likes Bach',
    'Popping and hopping!',
    'It pumped me up'
  ]
  Exercise.all.each do |exercise|
    users = User.all.reject { |usr| usr == exercise.user }.sample(rand(3..15))
    users.each do |user|
      Review.create(
        exercise: exercise,
        user: user,
        content: comments.sample,
        vote: rand(0..1)
      )
    end
  end
  # ====================================
end

def musics
  ### Music
  # ===================
  Exercise.all.each do |exercise|
    Music.create(
      bpm: 80,
      key_signature: 2,
      notes: JSON[[['C4', 4], ['D4', 4], ['E4', 4], ['G4', 4]]],
      chords: JSON[[[%w[C3 E3 G3], 1]]],
      user: exercise.user,
      is_question: true,
      status: 1,
      exercise: exercise
    )
    # User
    #   .all
    #   .sample(rand(3..15))
    #   .each do |user|
    #     Music.create(
    #       bpm: 80,
    #       key_signature: 2,
    #       notes: JSON[[['C4', 4], ['D4', 4], ['E4', 4], ['G4', 4]]],
    #       chords: JSON[[[%w[C3 E3 G3], 1]]],
    #       user: user,
    #       is_question: false,
    #       status: rand(0..1),
    #       exercise: exercise
    #     )
    #   end
  end
  # ====================================
end
