//
// Created by xnxin on 2017/12/14.
// Copyright (c) 2017 xnxin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public class LoginViewModel {

    let disposeBag = DisposeBag()
    
    //用户名是否长度符合
    open var isUserNameLegal: Variable<Bool> = Variable<Bool>(false)
    //密码是否长度符合
    open var isPasswordLegal: Variable<Bool> = Variable<Bool>(false)
    //是否允许登录
    open var isEnabledLogin: Variable<Bool> = Variable<Bool>(false)

    public init(_ name: ControlProperty<String?>,
                passwd: ControlProperty<String?>,
                login: ControlEvent<Void>)
    {
        name.orEmpty.asObservable()
            .flatMapLatest { Observable.just(UserNameValidator.validator($0))}
            .bind(to: isUserNameLegal)
            .disposed(by: disposeBag)
		
        passwd.orEmpty.asObservable()
            .flatMapLatest { Observable.just(PasswordValidator.validator($0))}
            .bind(to: isPasswordLegal)
            .disposed(by: disposeBag)
        
        Observable.combineLatest(isUserNameLegal.asObservable(), isPasswordLegal.asObservable()) { $0 && $1}
            .bind(to: isEnabledLogin)
            .disposed(by: disposeBag)
        
    }
}
