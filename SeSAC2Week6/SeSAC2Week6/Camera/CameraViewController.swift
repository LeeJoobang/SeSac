import UIKit

import YPImagePicker

import Alamofire
import SwiftyJSON
class CameraViewController: UIViewController {
    
    @IBOutlet weak var resultImageView: UIImageView!
    
    // uiimagepickerController1.
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // uiimagepickerController2.
        picker.delegate = self
    }
    
    
    
    // open source
    // 권한은 허용해주세요
    // 권한 문구 등도 내부적으로 구현! 실제로 카메라를 쓸 때 권한 요청
    @IBAction func ypImagePickeClicked(_ sender: UIButton) {
        
        let picker = YPImagePicker()
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                
                self.resultImageView.image = photo.image
            }
            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
        
    }
    
    //UIImagePickerController
    @IBAction func cameraButtonClickec(_ sender: UIButton) {
        // uiimagepickerController6.
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("사용불가 + 사용자에게 토스트 / 알럿")
            return
        }
        
        // uiimagepickerController8. 어떤 피커를 할지
        picker.sourceType = .camera
        picker.allowsEditing = true // default는 false이다. false면 편집화면이 안나온다.
        
        // uiimagepickerController7. picker 띄우기
        present(picker, animated: true)
        
        // 여기까지 하고 picker4를 한다.
        
        
        
        
    }
    
    //UIImagePickerController
    @IBAction func photoLibraryButtonClicked(_ sender: UIButton) {
        
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("사용불가 + 사용자에게 토스트 / 알럿")
            return
        }
        
        // uiimagepickerController10. 어떤 피커를 할지 - 지금은 포토 라이브러리
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true // default는 false이다. false면 편집화면이 안나온다.
        
        // uiimagepickerController9. picker 띄우기
        present(picker, animated: true)
        
    }
    
    @IBAction func savePhotoLibrary(_ sender: UIButton) {
        
        if let image = resultImageView.image {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
    // 이미지 뷰 이미지 > 네이버 > 얼굴 분석 해줘 요청 > 응답
    // 문자열이 아닌 파일, 이미지, pdf 파일 자체가 그대로 전송되지 않음. => 텍스트로 인코딩
    // 어떤 파일의 종류가 서버에 전달이 되는지 명시 = content-type

    @IBAction func clovarButtonClicked(_ sender: UIButton) {
        let url = "https://openapi.naver.com/v1/vision/celebrity"
        
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": "RtomGF3WUvgDker0Ty8M",
            "X-Naver-Client-Secret": "9ZZQhMT8xW",
//            "Content-Type": "multipart/form-data"
        ]
        
        
        //uiimage를 텍스트 형태로(바이너리 타입)으로 반환해서 전달해야 한다.
        guard let imageData = resultImageView.image?.jpegData(compressionQuality: 0.3) else { return }
        
        AF.upload(multipartFormData: { multipartFormData in // 클로저 구문 내 파일, 이미지가 one, two로 전달된다.
            multipartFormData.append(imageData, withName: "image") //
        }, to: url, headers: header)
        .validate(statusCode: 200...500).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
            case .failure(let error):
                print(error)
            }
        }
        
        
        
    }
    
}

// uiimagepickerController3.
// navigation controller를 상속 받고 있음.
extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // uiimagepickerController4. 사진을 선택하거나 카메라 촬영 직후
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(#function)
        
        //원본, 편집, 메타 데이터 등 - infokey
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.resultImageView.image = image
            dismiss(animated: true)
            // originalImage로 했더니 사진이 resultImageView에 표시가 되었다.
            // editimage때는 안되었다.
        } else {
            
        }
    }
    
    // uiimagepickerController5. 취소 버튼 클릭 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(#function)
        // 우리가 직접 구현해야 할 디스미스
        
        
    }
    
}
