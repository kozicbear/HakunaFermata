# Setup code
use_random_seed Time.now.to_i
roots = [:c4, :d4, :e4, :f4, :g4, :a4, :b4]
type = [:major, :minor]
chord_numerals = [:i, :ii, :iii, :iv, :v, :vi, :vii]


# key choosing
key = [roots.choose, type.choose]

# Chord section choosing
size=3
a_chords=[]
b_chords=[]
for i in 0..size
  a_chords[i]= chord_numerals.choose
  b_chords[i]= chord_numerals.choose
end
progression_a = a_chords.ring
progression_b = b_chords.ring

# bpm selection
bpm = 60 + rand(60)
use_bpm bpm

# melody rythm selection
rythm_length_a = rand(10)
a_rythm = []
a_notes = []
a_scale = scale key[0], key[1], num_octaves: 2
for i in 0...rythm_length_a
  a_rythm[i] = 0.3 + rand(0...3)
  a_notes[i] = a_scale.choose
end


# play song
live_loop :song do
  
  in_thread do
    8.times do
      play chord_degree(progression_a.tick, key[0], key[1], 3), release: 4
      sleep 4
    end
  end
  
  loop do
    play_pattern_timed a_notes, a_rythm
  end
  
  puts "enterting section b"
  
  in_thread do
    8.times do
      play chord_degree(progression_b.tick, key[0], key[1], 3), release: 4
      sleep 4
    end
  end
  
end

##| live_loop :melody_a  do
##|   play scale(:c4, :major, num_octaves: 2).choose
##|   sleep 0.5
##| end
