//
//  AnySynchronizationCustomPerformer.swift
//  Synchronization-swift
//
//  Created by Evegeny Kalashnikov on 17.06.2020.
//

import Foundation
import PromiseKit

public protocol AnySynchronizationCustomPerformer: AnyObject {
    func customPerform<Result: AnySyncResult>(for request: URLRequest, node: SyncNode) -> Promise<Result>?
    func resolve(error: Error, model: AnySynchronizable, settings: AnySyncSettings) -> SynchronizationResolveTypes
    func afterSynchronization(model: AnySynchronizable, result: AnySyncResult) -> Promise<Void>
    func afterAll(model: AnySynchronizable, result: AnySyncResult) -> Promise<Void>
}

public extension AnySynchronizationCustomPerformer { // for optional
    func customPerform<Result: AnySynchronizable>(for request: URLRequest, node: SyncNode) -> Promise<Result>? { nil }
    func resolve(error: Error, model: AnySynchronizable) -> SynchronizationResolveTypes { .none }
    func afterSynchronization(model: AnySynchronizable, result: AnySyncResult) -> Promise<Void> { .value }
    func afterAll(model: AnySynchronizable, result: AnySyncResult) -> Promise<Void> { .value }
}
