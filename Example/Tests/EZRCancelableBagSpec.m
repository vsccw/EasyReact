/**
 * Beijing Sankuai Online Technology Co.,Ltd (Meituan)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

QuickSpecBegin(EZRCancelableBagSpec)

describe(@"CancelableBag", ^{
    it(@"can create a cancel bag use +bag", ^{
        EZRCancelableBag *bag = [EZRCancelableBag bag];
        expect(bag).notTo(beNil());
        expect(bag).to(beAKindOf(EZRCancelableBag.class));
    });
    
    it(@"can add a cancelable and the cancelable will cancel after bag cancelling", ^{
        id<EZRCancelable> aCancelableInstance = mockProtocol(@protocol(EZRCancelable));
        EZRCancelableBag *bag = [EZRCancelableBag bag];
        [bag addCancelable:aCancelableInstance];
        [bag cancel];
        [verifyCount(aCancelableInstance, times(1)) cancel];
    });
    
    it(@"can remove a cancelable and the cancelable will not cancel after bag cancelling", ^{
        id<EZRCancelable> aCancelableInstance = mockProtocol(@protocol(EZRCancelable));
        EZRCancelableBag *bag = [EZRCancelableBag bag];
        [bag addCancelable:aCancelableInstance];
        [bag removeCancelable:aCancelableInstance];
        [bag cancel];
        [verifyCount(aCancelableInstance, never()) cancel];
    });
});

QuickSpecEnd
