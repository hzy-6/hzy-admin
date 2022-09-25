/**
 * Api 消息返回类
 */
export class ApiResult<T> {
    /**
     * api 状态码
     */
    code: number

    /**
     * api 消息
     */
    message: string

    /**
     * api 数据
     */
    data: T
}

