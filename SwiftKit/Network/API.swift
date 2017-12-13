//
//  API.swift
//  Farm
//
//  Created by hx on 2016/12/21.
//  Copyright © 2016年 xnxin. All rights reserved.
//

import Foundation
import Moya

enum API {
    
    enum FileType: Int {
        case avatar = 1
        case merchant
        case goods
        case consume
    }
    
    case notice(Requestable)
    
    case login(Requestable)
    case findPasswd(Requestable)
    case getValidCode(Requestable)
    case checkValidCode(Requestable)

    case personalInfo
    case message

    case goodsList(Requestable)
    case goodsDetail(Requestable)
    case goodsCategoryList
    case searchGoodsCategoryList(Requestable)
    
    case addGoods(Requestable)
    case editGoods(Requestable)
    
    ///置顶
    case makeGoodsTop(Requestable)
    ///删除
	case deleteGoods(Requestable)
    ///批量上架
    case goodsOnSales(Requestable)
    ///批量下架
    case goodsOffSales(Requestable)
    
    ///我要做秒杀
    case newDiscount(Requestable)
    
    ///FIXME: 有问题
    case uploadFile(type: FileType, images: [UIImage])
}

extension API: APPTargetType {
    /// The method used for parameter encoding.
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.httpBody
    }

    /// The method used for parameter encoding.

    
    var path: String {
        switch self {
            
        case .notice:
            return "bApi/user/queryNotice"

        case .login:
            return "bApi/user/login"
        case .getValidCode:
            return "bApi/user/getCode"
        case .checkValidCode(let model as CheckValidCode):
            return String(format: "/common/%@/%@/checkCode", model.phone, model.code)
        case .findPasswd:
            return "bApi/user/resetPass"


        case .personalInfo:
            return "bApi/person/detail"


        case .message:
            return "bApi/systemMessage/list"

        case .goodsList:
            return "bApi/goods/getGoodsList"
        case .goodsDetail:
            return "bApi/goods/getGoods"
        case .goodsCategoryList:
            return "bApi/goods/getGoodsCategoryList"
        case .searchGoodsCategoryList:
            return "bApi/goods/getSearchCategoryList"
        
        case .addGoods:
            return "bApi/goods/addGoods"
        case .editGoods:
            return "bApi/goods/updateGoods"
        case .makeGoodsTop:
            return "bApi/goods/setTopGoods"
        case .deleteGoods:
            return "bApi/goods/deleteBatchGoods"
        case .goodsOnSales:
            return "bApi/goods/upBatchGoods"
        case .goodsOffSales:
            return "bApi/goods/downBatchGoods"
            
        case .newDiscount:
            return "bApi/secondKill/addSecondKill"
        case .uploadFile:
            return "api/fileUp/fileUpload"

        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        
        switch self {
            case .login,
                 .findPasswd,
                 .newDiscount,
                 .addGoods,
                 .editGoods,
                 .uploadFile,
                 .makeGoodsTop,
                 .deleteGoods,
                 .goodsOnSales,
                 .goodsOffSales:
                
            return .post
            
        case .notice,
             .getValidCode,
             .checkValidCode,
             .personalInfo,
             .message,
             .goodsList,
             .goodsDetail,
             .goodsCategoryList,
             .searchGoodsCategoryList:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .notice(let model):
            return model.toJSON()
        case .login(let model):
            return model.toJSON()
        case .getValidCode(let model):
            return model.toJSON()
        case .checkValidCode(let model):
            return model.toJSON()
        case .findPasswd(let model):
            return model.toJSON()

        case .goodsList(let model):
            return model.toJSON()
        case .goodsDetail(let model):
            return model.toJSON()
            
        case .addGoods(let model):
            return model.toJSON()
        case .editGoods(let model):
            return model.toJSON()
        case .searchGoodsCategoryList(let model):
            return model.toJSON()
            
        case .makeGoodsTop(let model):
            return model.toJSON()
        case .deleteGoods(let model):
            return model.toJSON()
        case .goodsOnSales(let model):
            return model.toJSON()
        case .goodsOffSales(let model):
            return model.toJSON()

        case .newDiscount(let model):
            return model.toJSON()
            
        case .uploadFile(let type, _):
            return ["type": type.rawValue]
            
        case .personalInfo,
             .message,
             .goodsCategoryList:
            return nil
        }
    }
    
    var sampleData: Data {
        
        switch self {
        case .goodsList:
            return stubbedResponse("goods")
        default:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .uploadFile( _ , let images):
            
            var data = [MultipartFormData]()
            for image in images {
                if let imageData = MultipartFormData(image: image) {
                    data.append(imageData)
                }
            }
            return .upload(.multipart(data))
        default:
            return .request
        }
    }
    
    
    var isMock: Bool {
        return false
    }
}
