// --------------------------------------------------------------------------
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//
// The MIT License (MIT)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the ""Software""), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//
// --------------------------------------------------------------------------

import Foundation

/// View Model for the service client file.
struct ServiceClientFileViewModel {
    let name: String
    let comment: ViewModelComment
    let operationGroups: [OperationGroupViewModel]
    let apiVersion: String
    let apiVersionName: String
    let protocols: String
    let paging: Language.PagingNames?
    let globalParameters: [ParameterViewModel]
    // A dictionary of all the named operation group. Key is the group name , Value is the operation group view model.
    let namedOperationGroups: [String: OperationGroupViewModel]
    // A key,Value pairs of all the named operation group for stencil template engine
    let namedOperationGroupProperties: [KeyValueViewModel]

    init(from model: CodeModel) {
        self.name = "\(model.packageName)Client"
        self.comment = ViewModelComment(from: model.description)
        var operationGroups = [OperationGroupViewModel]()
        var namedOperationGroups = [String: OperationGroupViewModel]()
        var namedOperationGroupProperties = [KeyValueViewModel]()
        for group in model.operationGroups {
            var viewModel = OperationGroupViewModel(from: group, with: model)
            var groupName = group.name.trimmingCharacters(in: .whitespacesAndNewlines)
            if groupName.isEmpty {
                operationGroups.append(viewModel)
                // if the operation group name has a collision with a model object, append 'Operation' to the operation group name
            } else if model.object(for: groupName) != nil {
                groupName += "Operation"
                viewModel.name = groupName
                namedOperationGroups[groupName] = viewModel
            } else {
                namedOperationGroups[groupName] = viewModel
            }
        }
        self.operationGroups = operationGroups
        self.namedOperationGroups = namedOperationGroups
        self.apiVersion = model.getApiVersion()
        self.apiVersionName = "v\(apiVersion.replacingOccurrences(of: "-", with: ""))"
        self.paging = model.pagingNames
        self.protocols = paging != nil ? "PipelineClient, PageableClient" : "PipelineClient"
        var globalParameters = [ParameterViewModel]()
        for globalParameter in model.globalParameters ?? [] where !globalParameter.name.starts(with: "$") {
            globalParameters.append(ParameterViewModel(from: globalParameter))
        }
        self.globalParameters = globalParameters
        for key in namedOperationGroups.keys {
            namedOperationGroupProperties.append(KeyValueViewModel(key: key, value: key.lowercased()))
        }
        self.namedOperationGroupProperties = namedOperationGroupProperties
    }
}
