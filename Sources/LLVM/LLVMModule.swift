import SystemPackage
import LLVMC

@frozen
public struct LLVMModule {
    
    @usableFromInline
    internal final class _Storage {
        
        @usableFromInline
        internal let rawModule: LLVMModuleRef
        
        @usableFromInline
        internal let context: LLVMContext
        
        @inlinable
        internal init(id: String, in context: LLVMContext) {
            self.rawModule = LLVMModuleCreateWithNameInContext(
                id,
                context._rawContext
            )
            self.context = context
        }
        
        @inlinable
        deinit {
            LLVMDisposeModule(rawModule)
        }
    }
    
    @usableFromInline
    internal let _storage: _Storage
    
    @inlinable
    public init(id: String, sourceFileName: String, in context: LLVMContext) {
        let storage = _Storage(id: id, in: context)
        var sourceFileName = sourceFileName
        sourceFileName.withUTF8 { buffer in
            LLVMSetSourceFileName(storage.rawModule, buffer.baseAddress, buffer.count)
        }
        self._storage = storage
    }
    
    @inlinable
    public func write(to fileDescriptor: FileDescriptor) throws -> Int {
        let rawMessage = LLVMPrintModuleToString(
            _rawModule
        ) as UnsafeMutablePointer<CChar>
        defer {
            LLVMDisposeMessage(rawMessage)
        }
        var count = 0
        while rawMessage[count] != 0 {
            count += 1
        }
        return try fileDescriptor.writeAll(
            UnsafeMutableRawBufferPointer(start: rawMessage, count: count)
        )
    }
    
    @inlinable
    internal var _rawModule: LLVMModuleRef { _storage.rawModule }
}

extension LLVMModule: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMModule, rhs: LLVMModule) -> Bool {
        lhs._rawModule == rhs._rawModule
    }
}

extension LLVMModule: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawModule)
    }
}
