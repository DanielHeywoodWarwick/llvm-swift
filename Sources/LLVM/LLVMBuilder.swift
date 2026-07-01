import LLVMC

@frozen
public struct LLVMBuilder {
    
    @usableFromInline
    internal final class _Builder {
        
        @usableFromInline
        internal let rawBuilder: LLVMBuilderRef
        
        @inlinable
        internal init(in context: LLVMContext) {
            self.rawBuilder = LLVMCreateBuilderInContext(context._context.rawContext)
        }
        
        @inlinable
        deinit {
            LLVMDisposeBuilder(rawBuilder)
        }
    }
    
    @usableFromInline
    internal let _builder: _Builder
    
    @inlinable
    public init(in context: LLVMContext) {
        self._builder = _Builder(in: context)
    }
}
