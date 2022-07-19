import UIKit

class TrendSearchTableViewController: UITableViewController {

    var movieTitle = ["해리포터 20주년", "해리포터와 잉크 마법사의 여행", "해리포터와 죽음의 성물 1", "해리포터와 죽음의 성물 2", "해리포터와 불의 잔"]
    
    
    var movieDate = ["2022.01.01 | EN", "2020.12.01 | EN", "2010.10.17 | EN", "2011.07.07 | EN", "2005.11.16 | EN" ]
    
    var movieSummary = ["0_해리포터와 마법사의 돌 20주년 기념 스페셜. 다니엘 래드클리프, 루퍼트 그린트, 엠마 왓슨을 포함한 캐스트, 감독들이 재결합해 해리포터 프랜차이즈의 첫 영화를 회고하고, 축하하는 시간을 가진다. 해리포터 20주년 기념: 리턴 투 호그와트는 심층 인터뷰와 출연진 토크를 통해 역대 가장 사랑 받았던, 마법 같은 프랜차이즈의 세계로 팬들을 초대한다. 헬레나 본햄 카터, 로비 콜트레인, 랄프 파인즈, 제이슨 아이삭스, 게리 올드만, 톰 펠튼, 제임스 펠프스, 올리버 펠프스, 마크 윌리엄스, 보니 라이트, 알프레드 에녹, 매튜 루이스, 이반나 린치를 포함한 다양한 캐스트들이 함께 한다.", "1_테네시 주에서 개최된 이 컨벤션에 참가하기 위해 전 세계 70여 명 이상의 타투이스트들이 모였다.해리 포터라는 공통된 관심사로 뭉친 이들이 컨벤션을 개최하기까지의 과정을 담아낸 영화는 타투 컨벤션에 참가한 다양한 타투이스트들의 이야기와 삶, 꿈에 대해 듣는다.", "2_덤블도어 교장의 죽음 이후, 마법부는 죽음을 먹는 자들에게 점령당하고 호그와트는 위기에 빠진다. 이에 해리와 론, 헤르미온느는 볼드모트를 물리칠 수 있는 유일한 단서이자 그의 영혼이 담긴 ‘성물’ 호크룩스를 찾기 위한 위험한 여정에 나선다. 그러나 영혼이 연결되어 있는 볼드모트와 해리. 볼드모트를 파괴하면 해리의 목숨 또한 위태로워질지 모른다! 죽느냐 죽이느냐, 이제 그 마지막 대결은 극한을 향해 치닫는데…", "3_덤블도어 교장이 남긴 ‘죽음의 성물’의 단서를 쫓던 해리 포터는 볼드모트가 그토록 찾아 다닌 절대적인 힘을 가진 지팡이의 비밀을 통해 드디어 마지막 퍼즐을 완성한다. 볼드모트의 영혼이 담긴 다섯 번째 ‘호크룩스’를 찾기 위해 마법학교 호그와트로 돌아온 해리와 친구들은 그들을 잡으려는 보안마법에 걸려 위기를 맞지만 덤블도어의 동생인 에버포스의 도움으로 벗어난다. 그리고 그에게서 덤블도어와 어둠의 마법사 그린델왈드에 관한 놀라운 과거에 대해 알게 된다. 한편, 볼드모트는 해리에 의해 호크룩스들이 파괴되었음을 느끼고 호그와트로 향한다. 해리를 주축으로 한 불사조 기사단과 죽음을 먹는 자들 간의 마법전투가 벌어지고 여기에 거대거미", "4_요즘 들어 매일 꾸는 악몽 때문에 이마의 상처에 더욱 통증을 느끼는 해리(다니엘 래드클래프)는 친구 론(루퍼트 그린트)과 헤르미온느(엠마 왓슨)와 함께 퀴디치 월드컵에 참가해 악몽에서 벗어날 수 있게 돼 마냥 기쁘다. 그러나 퀴디치 캠프장 근방 하늘에 불길한 기운, 바로 마왕 볼드모트의 상징인 '어둠의 표식'이 나타난다. 볼드모트가 13년 전에 자취를 감춘 뒤 감히 모습을 드러내지 못했던 그의 추종자 데스 이터들이 그 표식을 불러낸 것이다."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieTitle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TrendSearchTableViewCell", for: indexPath) as! TrendSearchTableViewCell
        cell.movieTitleLabel.text = movieTitle[indexPath.row]
        cell.movieTitleLabel.font = .boldSystemFont(ofSize: 14)
        
        cell.movieDateLabel.text = movieDate[indexPath.row]
        cell.movieDateLabel.font = .boldSystemFont(ofSize: 12)

        cell.movieSummaryLabel.text = movieSummary[indexPath.row]
        cell.movieSummaryLabel.font = .boldSystemFont(ofSize: 13)

        return cell
    }
    
    
}
