import UIKit


struct MovieItem {
    let title: String
    let subtitle: String
    let review: String
    let image: UIImage
}

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    // DataSource -> Items for TableView
    let movies: [MovieItem] = [
        
        MovieItem(
            title: "Harry Potter 3",
            subtitle: "Alfonso Cuarón",
            review: "Dark, atmospheric",
            image: .hp
        ),

        MovieItem(
            title: "The Hunger Games",
            subtitle: "Gary Ross",
            review: "Very emotional",
            image: .hungerGames
        ),

        MovieItem(
            title: "Supernatural",
            subtitle: "Eric Kripke",
            review: "Mystery and emotional depth",
            image: .supernatural
        ),

        MovieItem(
            title: "Now You See Me 2",
            subtitle: "Jon M. Chu ",
            review: "Fun, stylish and plot twist",
            image: .nysm
        ),

        MovieItem(
            title: "Sherlock",
            subtitle: "Moffat & Gatiss",
            review: "Brilliant writing",
            image: .sherlock
        )
    ]
    let music: [MovieItem] = [
            MovieItem(title: "Wiped Out!", subtitle: "the Neighbourhood",
                      review: "Dark and atmospheric",
                      image: .theNeighbourhood),

            MovieItem(title: "Diamond Eyes", subtitle: "Deftones",
                      review: "Energetic and emotional",
                      image: .deftones),

            MovieItem(title: "Demon Days", subtitle: "Gorillaz",
                      review: "Unique, creative",
                      image: .gorillaz),

            MovieItem(title: "West Coast", subtitle: "Lana Del Rey",
                      review: "Dreamy and nostalgic",
                      image: .lana),

            MovieItem(title: "Midnights", subtitle: "Taylor Swift",
                      review: "Timeless",
                      image: .taylor)
        ]

        let books: [MovieItem] = [
            MovieItem(title: "A good girls guide to murder", subtitle: "Holly Jackson",
                      review: "Clever mystery",
                      image: .agggtm),

            MovieItem(title: "Call of Cthulhu", subtitle: "H.P. Lovecraft",
                      review: "Classic horror",
                      image: .cc),

            MovieItem(title: "The Hunger Games", subtitle: "Suzanne Collins",
                      review: "Strong dystopian",
                      image: .thg),

            MovieItem(title: "Harry Potter", subtitle: "J.K. Rowling",
                      review: "Magical and nostalgic",
                      image: .hpbook),

            MovieItem(title: "Frankenstein", subtitle: "Mary Shelley",
                      review: "Dark, emotional",
                      image: .frankenstein)
        ]

        let courses: [MovieItem] = [
            MovieItem(title: "iOS Development", subtitle: "Mobile Dev",
                      review: "UIKit, layouts, TableViews",
                      image: .hp),

            MovieItem(title: "Algorithms", subtitle: "CS Core",
                      review: "Logic, structures",
                      image: .thg),

            MovieItem(title: "Software Engineering", subtitle: "CS",
                      review: "Processes, memory",
                      image: .lana),

            MovieItem(title: "Linear Algebra", subtitle: "Math",
                      review: "Vectors, matrices",
                      image: .taylor),

            MovieItem(title: "Databases", subtitle: "CS",
                      review: "Queries and data design",
                      image: .agggtm)
        ]
    
    lazy var data: [[MovieItem]] = [movies, music, books, courses]

        let sectionTitles = [
            "Favorite Movies",
            "Favorite Music",
            "Favorite Books",
            "Favorite University Courses"
        ]


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self // To Setup and Render TableView
        tableView.delegate = self // to handle actions from TableView
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return data.count // 4
        }
    
    // How many elements show in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count // 5
    }
    // Section Header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    // Configure Cell for each row -> UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell // Set from MainStoryboard at cell properties
        let item = data[indexPath.section][indexPath.row]
        cell.configure(item: item)
        return cell
    }

    
}

extension ViewController: UITableViewDelegate {
    // On cell pressed, method returns indexPath(section, row)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected section \(indexPath.section), row \(indexPath.row)")
    }
}
