# HakunaFermata

I wanted to create an Ambient music piece. The song consists of two main parts, a section playing chords, and a section playing the melody.

The key feature of this project is that no two creations are the same. The system via random selection has the ability to create a song in any major or minor key. The choice it makes for key ultimately dictates the genre of the song.

Although the song is looping itself, there is a lot of variation thoughout as we listen to the melody get out of sync with the chords, and create new interesting relationships and meanings as the song goes on.

## System Process

1. The system selects a random key
2. From that key the system creates two different chord progressionss of four chords for our A and B section
3. A slow tempo is selected via setting bpm
4. From the key two melodies, of unique lengths, and unique rythms are created randomly
5. Now the song is played
6. The chords are set to play the A section twice, then the B section twice
7. The melody remains independent of that chords rythm making the sound more atmospheric
8. A counter is set so that at a random iteration of the playing set melodies, melody b will be played instead of the main line of a
9. Melody a will play 3 times, and repeatedly do so till that counter is triggered. Then melody plays 4 times.
10. Both the chords and melody are repeated indefintely

## Song example
https://github.com/kozicbear/HakunaFermata/assets/112917494/da730192-c1f8-4334-b9b8-b4e806d0a8c7

