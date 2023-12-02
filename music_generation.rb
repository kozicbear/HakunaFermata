# Welcome to Sonic Pi
puts scale(:c4, :major)

puts chord_degree(:iii, :c4, :major)

##| progression = (ring, :i, :v, :vi, :iv)


chord_numerals = [:i, :ii, :iii, :iv, :v, :vi, :vii]

# A section choosing
size=3
a_chords=[]
for i in 0..size
  a_chords[i]=choose(chord_numerals)
end

print a_chords

progression = a_chords.ring

# B section choosing



use_bpm 90

live_loop :prog do
  play chord_degree(progression.tick, :c3, :major, 3), release: 4
  sleep 4
end

##| live_loop :melody do
##|   play scale(:c4, :major, num_octaves: 2).choose
##|   sleep 0.5
##| end
