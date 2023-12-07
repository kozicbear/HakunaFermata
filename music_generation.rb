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
bpm = 30 + rand(30)
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

use_random_seed Time.now.to_i

rythm_length_b = rand(10)
b_rythm = []
b_notes = []
b_scale = scale key[0], key[1], num_octaves: 2
for i in 0...rythm_length_b
  b_rythm[i] = 0.3 + rand(0...5)
  b_notes[i] = b_scale.choose
end

# Play song
in_thread do
  use_synth :hoover
  loop do
    8.times do
      play chord_degree(progression_a.tick, key[0], key[1], 3), amp: 0.3, release: 5
      sleep 4
    end
    8.times do
      play chord_degree(progression_b.tick, key[0], key[1], 4), amp: 0.3, release: 5
      sleep 4
    end
  end
end

melody_switcher = 0
b_mel_switcher = rand(1..3).to_i

use_synth :hollow
loop do
  if melody_switcher == b_mel_switcher
    melody_switcher = 0
    puts "b"
    4.times do
      play_pattern_timed b_notes, b_rythm
    end
  else
    puts "a"
    3.times do
      play_pattern_timed a_notes, a_rythm
    end
    melody_switcher += 1
  end
end
