import UIKit
import AVFAudio

class ViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var progressSlider: UIProgressView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    var player: AVAudioPlayer?
    var currentIndex: Int = 0
    var isPlaying: Bool = false
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTrack(index: currentIndex)
        playPauseButton.tintColor = .white
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        playNextSong()
    }
    @IBAction func prevButtonTapped(_ sender: UIButton) {
        playPreviousSong()
    }
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        togglePlayPause()
    }
    func togglePlayPause() {
        guard let player = player else {
            playMusic()
            return }
            
        if isPlaying {
            player.pause()
            timer?.invalidate()
        } else {
            player.play()
            startTimer()
        }
            
        isPlaying.toggle()
        updatePlayPauseButton()
        }
    func playNextSong() {
            currentIndex = (currentIndex + 1) % arrayOfSongs.count
            loadTrack(index: currentIndex)
            playMusic()
        }
        
    func playPreviousSong() {
        currentIndex = (currentIndex - 1 + arrayOfSongs.count) % arrayOfSongs.count
        loadTrack(index: currentIndex)
        playMusic()
    }
        
    func playMusic() {
        let currentSong = arrayOfSongs[currentIndex]
        guard let url = Bundle.main.url(forResource: currentSong.fileName, withExtension: "mp3") else {
            print("not found: \(currentSong.fileName)")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
            isPlaying = true
            startTimer()
            updatePlayPauseButton()
        } catch {
            print("Error loading: \(error.localizedDescription)")
        }
    }
    func loadTrack(index: Int) {
            let song = arrayOfSongs[index]
            songLabel.text = song.songTitle
            artistLabel.text = song.artist
            coverImageView.image = UIImage(named: song.coverImage)
            durationLabel.text = formatTime(Double(song.durationTime))
            currentTimeLabel.text = "00:00"
            progressSlider.progress = 0
        }
    func updatePlayPauseButton() {
        let iconName = isPlaying ? "pause.fill" : "play.fill"
        playPauseButton.setImage(UIImage(systemName: iconName), for: .normal)
    }
    func startTimer() {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
                guard let self = self, let player = self.player else { return }
                let progress = Float(player.currentTime / player.duration)
                self.progressSlider.progress = progress
                self.currentTimeLabel.text = self.formatTime(player.currentTime)
            }
        }
    func formatTime(_ time: TimeInterval) -> String {
            let minutes = Int(time) / 60
            let seconds = Int(time) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
}

