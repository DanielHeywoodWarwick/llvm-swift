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
    public init(id: String, in context: LLVMContext) {
        let storage = _Storage(id: id, in: context)
        self._storage = storage
    }
    
    @inlinable
    public func write(to file: FileDescriptor) throws -> Int {
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
        return try file.writeAll(
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
