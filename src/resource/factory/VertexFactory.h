#pragma once

#include "resource/Resource.h"
#include "resource/ResourceFactory.h"

namespace LUS {

class VertexFactory : public ResourceFactory {
  public:
    std::shared_ptr<Resource> ReadResource(std::shared_ptr<ResourceInitData> initData,
                                           std::shared_ptr<BinaryReader> reader) override;
    std::shared_ptr<Resource> ReadResourceXML(std::shared_ptr<ResourceInitData> initData, tinyxml2::XMLElement* reader);
};

class VertexFactoryV0 : public ResourceVersionFactory {
  public:
    void ParseFileBinary(std::shared_ptr<BinaryReader> reader, std::shared_ptr<Resource> resource) override;
    void ParseFileXML(tinyxml2::XMLElement* reader, std::shared_ptr<Resource> resource) override;
};
} // namespace LUS
