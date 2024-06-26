//
//  SceneDelegate.swift
//  ReactivePrograming
//
//  Created by 전율 on 2024/05/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // UIWindowScene 객체로 변환
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // 새로운 UIWindow 생성하고 windowScene 설정
        let window = UIWindow(windowScene: windowScene)
        
        // 뷰 컨트롤러 인스턴스 생성
        let viewController = ViewController()
        
        // 네비게이션 컨트롤러 생성 (선택적)
        let navigationController = UINavigationController(rootViewController: viewController)

        // 윈도우의 루트 뷰 컨트롤러를 설정
        window.rootViewController = navigationController  // 네비게이션 컨트롤러 사용 시
        // window.rootViewController = viewController  // 단일 뷰 컨트롤러 사용 시

        // 현재 scene의 윈도우로 설정하고 보이게 함
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

